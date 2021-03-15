//
//  UILabel+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UILabel+Runtime.h"
#import "UITapGestureRecognizer+Runtime.h"
#import "UILongPressGestureRecognizer+Runtime.h"
#import <objc/runtime.h>

@implementation UILabel (Runtime)

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

#pragma mark -- 设置中横线
- (BOOL)throughLine
{
    return objc_getAssociatedObject(self, @"throughLine");
}

- (void)setThroughLine:(BOOL)throughLine
{
    objc_setAssociatedObject(self, @"throughLine", @(throughLine), OBJC_ASSOCIATION_RETAIN);
    if (throughLine) {
        NSDictionary *attribtDic = @{NSStrikethroughStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:self.text attributes:attribtDic];
        self.attributedText = attribtStr;
    }
}

#pragma mark -- 设置下横线
- (BOOL)underLine
{
    return objc_getAssociatedObject(self, @"underLine");
}

- (void)setUnderLine:(BOOL)underLine
{
    objc_setAssociatedObject(self, @"underLine", @(underLine), OBJC_ASSOCIATION_RETAIN);
    if (underLine) {
        NSDictionary *attribtDic = @{NSUnderlineStyleAttributeName: [NSNumber numberWithInteger:NSUnderlineStyleSingle]};
        NSMutableAttributedString *attribtStr = [[NSMutableAttributedString alloc]initWithString:self.text attributes:attribtDic];
        self.attributedText = attribtStr;
    }
}

@end
