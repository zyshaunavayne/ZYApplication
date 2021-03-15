//
//  UIFont+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UIFont+Runtime.h"
#import <objc/runtime.h>

@implementation UIFont (Runtime)

#pragma mark -- fontsize_8
- (UIFont *)fontsize_8
{
    return objc_getAssociatedObject(self, @"fontsize_8");
}

- (void)setFontsize_8:(UIFont *)fontsize_8
{
    objc_setAssociatedObject(self, @"fontsize_8", fontsize_8, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_8 = [UIFont fontsize:8.0f];
}

#pragma mark -- fontsize_9
- (UIFont *)fontsize_9
{
    return objc_getAssociatedObject(self, @"fontsize_9");
}

- (void)setFontsize_9:(UIFont *)fontsize_9
{
    objc_setAssociatedObject(self, @"fontsize_9", fontsize_9, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_9 = [UIFont fontsize:9.0f];
}

#pragma mark -- fontsize_10
- (UIFont *)fontsize_10
{
    return objc_getAssociatedObject(self, @"fontsize_10");
}

- (void)setFontsize_10:(UIFont *)fontsize_10
{
    objc_setAssociatedObject(self, @"fontsize_10", fontsize_10, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_10 = [UIFont fontsize:10.0f];
}

#pragma mark -- fontsize_11
- (UIFont *)fontsize_11
{
    return objc_getAssociatedObject(self, @"fontsize_11");
}

- (void)setFontsize_11:(UIFont *)fontsize_11
{
    objc_setAssociatedObject(self, @"fontsize_11", fontsize_11, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_11 = [UIFont fontsize:11.0f];
}

#pragma mark -- fontsize_12
- (UIFont *)fontsize_12
{
    return objc_getAssociatedObject(self, @"fontsize_12");
}

- (void)setFontsize_12:(UIFont *)fontsize_12
{
    objc_setAssociatedObject(self, @"fontsize_12", fontsize_12, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_12 = [UIFont fontsize:12.0f];
}

#pragma mark -- fontsize_13
- (UIFont *)fontsize_13
{
    return objc_getAssociatedObject(self, @"fontsize_13");
}

- (void)setFontsize_13:(UIFont *)fontsize_13
{
    objc_setAssociatedObject(self, @"fontsize_13", fontsize_13, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_13 = [UIFont fontsize:13.0f];
}

#pragma mark -- fontsize_14
- (UIFont *)fontsize_14
{
    return objc_getAssociatedObject(self, @"fontsize_14");
}

- (void)setFontsize_14:(UIFont *)fontsize_14
{
    objc_setAssociatedObject(self, @"fontsize_14", fontsize_14, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_14 = [UIFont fontsize:14.0f];
}

#pragma mark -- fontsize_15
- (UIFont *)fontsize_15
{
    return objc_getAssociatedObject(self, @"fontsize_15");
}

- (void)setFontsize_15:(UIFont *)fontsize_15
{
    objc_setAssociatedObject(self, @"fontsize_15", fontsize_15, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_15 = [UIFont fontsize:15.0f];
}

#pragma mark -- fontsize_16
- (UIFont *)fontsize_16
{
    return objc_getAssociatedObject(self, @"fontsize_16");
}

- (void)setFontsize_16:(UIFont *)fontsize_16
{
    objc_setAssociatedObject(self, @"fontsize_16", fontsize_16, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_16 = [UIFont fontsize:16.0f];
}

#pragma mark -- fontsize_17
- (UIFont *)fontsize_17
{
    return objc_getAssociatedObject(self, @"fontsize_17");
}

- (void)setFontsize_17:(UIFont *)fontsize_17
{
    objc_setAssociatedObject(self, @"fontsize_17", fontsize_17, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_17 = [UIFont fontsize:17.0f];
}

#pragma mark -- fontsize_18
- (UIFont *)fontsize_18
{
    return objc_getAssociatedObject(self, @"fontsize_18");
}

- (void)setFontsize_18:(UIFont *)fontsize_18
{
    objc_setAssociatedObject(self, @"fontsize_18", fontsize_18, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    self.fontsize_18 = [UIFont fontsize:18.0f];
}

+ (UIFont *)fontsize:(double)font
{
    return [UIFont systemFontOfSize:font];
}

+ (UIFont *)fontSizeBold:(double)font
{
    return [UIFont fontWithName:@"Helvetica-Bold" size:font];
}

+ (UIFont *)fontSize:(double)font type:(NSString *)type
{
    return [UIFont fontWithName:type.length != 0 ? type : @"Helvetica-Bold" size:font];
}

@end
