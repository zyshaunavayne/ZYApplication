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
