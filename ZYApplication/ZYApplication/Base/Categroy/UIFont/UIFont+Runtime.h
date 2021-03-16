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
