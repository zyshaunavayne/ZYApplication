//
//  UIColor+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIColor (Runtime)

/// RGB颜色
/// @param RGB 单色
+ (UIColor *)RGB:(NSInteger)RGB;

/// RGB颜色
/// @param RGB RGB 单色
/// @param A 透明度
+ (UIColor *)RGB:(NSInteger)RGB A:(float)A;

/// RGB颜色
/// @param R R
/// @param G G
/// @param B B
+ (UIColor *)R:(NSInteger)R G:(NSInteger)G B:(NSInteger)B;

/// RGB颜色
/// @param R R
/// @param G G
/// @param B B
/// @param A 透明度
+ (UIColor *)R:(NSInteger)R G:(NSInteger)G B:(NSInteger)B A:(float)A;

/// 十六进制颜色
/// @param Hex 十六进制字符串
+ (UIColor *)HEX:(NSString *)Hex;

/// 十六进制颜色
/// @param Hex 十六进制字符串
/// @param A 透明度
+ (UIColor *)HEX:(NSString *)Hex A:(float)A;

/// 线条分割线 颜色 230.230.230 1.0
+ (UIColor *)Line;

/// 背景色 246.246.246 1.0
+ (UIColor *)Background_Color;

/// 主题颜色 87.146.253 1.0
+ (UIColor *)Text_Theme;


@end

NS_ASSUME_NONNULL_END

