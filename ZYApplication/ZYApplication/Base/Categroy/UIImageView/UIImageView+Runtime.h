//
//  UIImageView+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImageView (Runtime)

/// 单击/双击/多击
/// @param singleTap 点击次数
/// @param taps UITapGestureRecognizer
- (void)addSingleTap:(NSInteger)singleTap singleAction:(void (^) (UITapGestureRecognizer *))taps;

/// 长按
/// @param longPress UILongPressGestureRecognizer
- (void)addLongPressAction:(void (^) (UILongPressGestureRecognizer *))longPress;

/// 全屏显示
/// @param imgArray 图片数组
/// @param selectIndex 被选中的图片
/// @param isDelete 是否显示删除
+ (void)showScreen:(NSArray *)imgArray selectIndex:(NSInteger)selectIndex isDelete:(BOOL)isDelete;

/// 增加圆角
/// @param corners 圆角位置 UIRectCorner
/// @param cornerRadius 圆角度
- (void)addCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius;

/// 添加网络图片
/// @param urlString 图片网路地址
/// @param placeholderImage 占位图(UIImage)/图name(NSString)
- (void)imageWithNetURLString:(NSString *)urlString placeholderImage:(_Nullable id)placeholderImage;

@end

NS_ASSUME_NONNULL_END
