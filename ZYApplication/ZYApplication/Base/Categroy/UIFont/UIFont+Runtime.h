//
//  UIFont+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIFont (Runtime)

/// 字体大小 8
@property (nonatomic, strong) UIFont *fontsize_8;

/// 字体大小 9
@property (nonatomic, strong) UIFont *fontsize_9;

/// 字体大小 10
@property (nonatomic, strong) UIFont *fontsize_10;

/// 字体大小 11
@property (nonatomic, strong) UIFont *fontsize_11;

/// 字体大小 12
@property (nonatomic, strong) UIFont *fontsize_12;

/// 字体大小 13
@property (nonatomic, strong) UIFont *fontsize_13;

/// 字体大小 14
@property (nonatomic, strong) UIFont *fontsize_14;

/// 字体大小 15
@property (nonatomic, strong) UIFont *fontsize_15;

/// 字体大小 16
@property (nonatomic, strong) UIFont *fontsize_16;

/// 字体大小 17
@property (nonatomic, strong) UIFont *fontsize_17;

/// 字体大小 18
@property (nonatomic, strong) UIFont *fontsize_18;

/// 字体大小
/// @param font 字体大小
+ (UIFont *)fontsize:(double)font;

/// 加粗字体
/// @param font 字体大小
+ (UIFont *)fontSizeBold:(double)font;

/// 字符类型+大小
/// @param font 字体大小
/// @param type 字体类型
+ (UIFont *)fontSize:(double)font type:(NSString *)type;

@end

NS_ASSUME_NONNULL_END
