//
//  UIView+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Runtime)

/// 单击/双击/多击
/// @param singleTap 点击次数
/// @param taps UITapGestureRecognizer
- (void)addSingleTap:(NSInteger)singleTap singleAction:(void (^) (UITapGestureRecognizer *))taps;

/// 长按
/// @param longPress UILongPressGestureRecognizer
- (void)addLongPressAction:(void (^) (UILongPressGestureRecognizer *))longPress;

/// 添加虚线边框
/// @param color 边框虚线颜色
/// @param width 边框虚线宽度
- (void)addDottedBoxWithLineColor:(UIColor *)color LineWidth:(CGFloat )width;

/// 设置水平方向上颜色渐变
/// @param colors 颜色数组
- (void)settingVerGradientLayerColors:(NSArray <UIColor *>*)colors;

@end

NS_ASSUME_NONNULL_END
