//
//  UITextField+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITextField (Runtime)

/// 字体大小
@property (nonatomic, strong) UIFont *placeholderFont;

/// 字体颜色
@property (nonatomic, strong) UIColor *placeholderColor;

/// placeholder Text 相同 默认NO
@property (nonatomic, assign) BOOL placeholderAndTextSame;

/// 字数限制 默认不限制
@property (nonatomic, assign) NSInteger textCount;

/// 只允许输入汉字
- (void)onlyChineseCharactersAllowed;

/// 增加layer
/// @param left 距左
/// @param right 距右
/// @param top 距上
/// @param bottom 距下
/// @param borderColor 颜色
/// @param borderWidth 宽度
/// @param cornerRadius 圆角
- (void)addLayerWithLeft:(CGFloat)left
                   right:(CGFloat)right
                     top:(CGFloat)top
                  bottom:(CGFloat)bottom
             borderColor:(UIColor *)borderColor
             borderWidth:(CGFloat)borderWidth
            cornerRadius:(CGFloat)cornerRadius;

@end

NS_ASSUME_NONNULL_END
