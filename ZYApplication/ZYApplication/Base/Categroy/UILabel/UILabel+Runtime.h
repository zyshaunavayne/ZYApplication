//
//  UILabel+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILabel (Runtime)

/// 单击/双击/多击
/// @param singleTap 点击次数
/// @param taps UITapGestureRecognizer
- (void)addSingleTap:(NSInteger)singleTap singleAction:(void (^) (UITapGestureRecognizer *))taps;

/// 长按
/// @param longPress UILongPressGestureRecognizer
- (void)addLongPressAction:(void (^) (UILongPressGestureRecognizer *))longPress;

/// 中横线 默认NO 请先设置text
@property (nonatomic, assign) BOOL throughLine;
 
/// 下横线 默认NO 请先设置text
@property (nonatomic, assign) BOOL underLine;

@end

NS_ASSUME_NONNULL_END
