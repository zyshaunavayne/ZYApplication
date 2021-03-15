//
//  UIView+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UIView+Runtime.h"
#import "UITapGestureRecognizer+Runtime.h"
#import "UILongPressGestureRecognizer+Runtime.h"

@implementation UIView (Runtime)

- (void)addSingleTap:(NSInteger)singleTap singleAction:(void (^)(UITapGestureRecognizer * _Nonnull))taps
{
    UITapGestureRecognizer *tapGestureRecognizer = UITapGestureRecognizer.alloc.init;
    [tapGestureRecognizer setNumberOfTapsRequired:singleTap];
    tapGestureRecognizer.block = ^(UITapGestureRecognizer * _Nonnull tap) {
        taps(tap);
    };
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)addLongPressAction:(void (^)(UILongPressGestureRecognizer * _Nonnull))longPress
{
    UILongPressGestureRecognizer *press = UILongPressGestureRecognizer.alloc.init;
    press.block = ^(UILongPressGestureRecognizer * _Nonnull tap) {
        longPress(tap);
    };
    [self addGestureRecognizer:press];
}

- (void)addDottedBoxWithLineColor:(UIColor *)color LineWidth:(CGFloat)width
{
   CAShapeLayer *border = [CAShapeLayer layer];
   //虚线的颜色
   border.strokeColor = color.CGColor;
   //填充的颜色
   border.fillColor = UIColor.clearColor.CGColor;
   //设置路径
   border.path = [UIBezierPath bezierPathWithRect:self.bounds].CGPath;
   border.frame = self.bounds;
   //虚线的宽度
   border.lineWidth = width;
   //设置线条的样式
   //border.lineCap = @"square";
   //虚线的间隔
   border.lineDashPattern = @[@4, @2];
  [self.layer addSublayer:border];
}

- (void)settingVerGradientLayerColors:(NSArray <UIColor *>*)colors
{
    for (CALayer *l in self.layer.sublayers) {
        if ([l isKindOfClass:[CAGradientLayer class]]) {
            [l removeFromSuperlayer];
            break;
        }
    }
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,self.bounds.size.width,self.bounds.size.height);
    gl.startPoint = CGPointMake(0, 0.5);
    gl.endPoint = CGPointMake(1, 0.5);
    NSMutableArray *colorArray = [[NSMutableArray alloc] init];
    for (NSInteger i = 0; i < colors.count; i ++) {
        UIColor *colorItem = colors[i];
        [colorArray addObject:(__bridge id)colorItem.CGColor];
    }
    gl.colors = colorArray;
    gl.locations = @[@(0.0f),@(1.0f)];
    
//    [self.layer addSublayer:gl];
    [self.layer insertSublayer:gl atIndex:0];
}

@end
