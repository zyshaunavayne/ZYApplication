//
//  UIImage+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UIImage+Runtime.h"

@implementation UIImage (Runtime)
+ (UIImage *)imageWithName:(NSString *)name
{
    return [UIImage imageNamed:name];
}

+ (UIImage *)imageWithPath:(NSString *)path
{
    return [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:path ofType:nil]];
}

@end
