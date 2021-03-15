//
//  UIButton+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UIButton+Runtime.h"
#import <objc/runtime.h>

@implementation UIButton (Runtime)

#pragma mark -点击事件的重写回调
- (void)setBlock:(void (^)(UIButton * _Nonnull))block
{
    objc_setAssociatedObject(self, @selector(block),block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}

- (void (^) (UIButton *))block
{
    return objc_getAssociatedObject(self, @selector(block));
}

- (void)click:(UIButton *)btn
{
    if (self.block) {
        self.block(btn);
    }
}

#pragma mark -- hitTestEdgeInsets
- (UIEdgeInsets)hitTestEdgeInsets
{
    NSValue *value = objc_getAssociatedObject(self, @"hitTestEdgeInsets");
    if (value) {
        UIEdgeInsets edgeInsets;
        [value getValue:&edgeInsets];
        return edgeInsets;
    } else {
        return UIEdgeInsetsZero;
    }
}

- (void)setHitTestEdgeInsets:(UIEdgeInsets)hitTestEdgeInsets
{
    NSValue *value = [NSValue value:&hitTestEdgeInsets withObjCType:@encode(UIEdgeInsets)];
    objc_setAssociatedObject(self, @"hitTestEdgeInsets", value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

#pragma mark -- he_timeInterval
#pragma mark - load, 交换响应的点击方法
+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL selSystem = @selector(sendAction:to:forEvent:);
        Method methodSystem = class_getInstanceMethod(self, selSystem);
        SEL selCustom = @selector(heSendAction:to:forEvent:);
        Method methodCustom = class_getInstanceMethod(self, selCustom);
        BOOL isAdd = class_addMethod(self, selSystem, method_getImplementation(methodCustom), method_getTypeEncoding(methodCustom));
        if (isAdd) {
            class_replaceMethod(self, selCustom, method_getImplementation(methodSystem), method_getTypeEncoding(methodSystem));
        } else {
            method_exchangeImplementations(methodSystem, methodCustom);
        }
    });
}
#pragma mark - 自定义方法, 用于替换系统的sendAction:to:forEvent: 方法
- (void)heSendAction:(SEL)action to:(id)target forEvent:(UIEvent *)event
{
    if ([NSStringFromClass(self.class) isEqualToString:@"UIButton"]) {
        self.he_timeInterval = (self.he_timeInterval == 0) ? 0.1 : self.he_timeInterval;
        if (self.isIgnoreEvent) return;
        if (self.he_timeInterval > 0) {
            [self performSelector:@selector(changeIgnoreState) withObject:self afterDelay:self.he_timeInterval];
        }
    }
    
    self.isIgnoreEvent = YES;
    [self heSendAction:action to:target forEvent:event];
}

#pragma mark 改变忽视重复点击状态
- (void)changeIgnoreState
{
    [self setIsIgnoreEvent:NO];
}

#pragma mark - he_timeInterval的setter, getter
- (void)setHe_timeInterval:(NSTimeInterval)he_timeInterval
{
    objc_setAssociatedObject(self, @selector(he_timeInterval), @(he_timeInterval), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSTimeInterval)he_timeInterval
{
    //_cmd 代表本方法的SEL, 就是 @selector(he_timeInterval) objc_getAssociatedObject(self, _cmd) 返回的是id类型, 需要类型转换
    return [objc_getAssociatedObject(self, _cmd) doubleValue];
}

#pragma mark - he_timeInterval的setter, getter
- (void)setIsIgnoreEvent:(BOOL)isIgnoreEvent
{
    objc_setAssociatedObject(self, @selector(isIgnoreEvent), @(isIgnoreEvent), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isIgnoreEvent
{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}

- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style imageTitleSpace:(CGFloat)space
{
    /**
     *  前置知识点：titleEdgeInsets是title相对于其上下左右的inset，跟tableView的contentInset是类似的，
     *  如果只有title，那它上下左右都是相对于button的，image也是一样；
     *  如果同时有image和label，那这时候image的上左下是相对于button，右边是相对于label的；title的上右下是相对于button，左边是相对于image的。
     */
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
        
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
        
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
        
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    switch (style) {
        case MKButtonEdgeInsetsStyleTop:
        {
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
        break;
        case MKButtonEdgeInsetsStyleLeft:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
        break;
        case MKButtonEdgeInsetsStyleBottom:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
        break;
        case MKButtonEdgeInsetsStyleRight:
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
        break;
        default:
        break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
