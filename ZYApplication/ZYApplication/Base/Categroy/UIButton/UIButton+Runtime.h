//
//  UIButton+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef NS_ENUM(NSUInteger, MKButtonEdgeInsetsStyle)
{
    MKButtonEdgeInsetsStyleTop, // image在上，label在下
    MKButtonEdgeInsetsStyleLeft, // image在左，label在右
    MKButtonEdgeInsetsStyleBottom, // image在下，label在上
    MKButtonEdgeInsetsStyleRight // image在右，label在左
};

@interface UIButton (Runtime)

/// 点击回调 touchUpInSide
@property (nonatomic, copy) void (^block) (UIButton *button);

/// 扩大点击范围 默认为（0，0，0，0）; 负的为扩大
@property (nonatomic,assign) UIEdgeInsets hitTestEdgeInsets;

/// 时间间隔, 控制重复点击的间隔时间
@property (nonatomic, assign) NSTimeInterval he_timeInterval;

/// 设置button的titleLabel和imageView的布局样式，及间距
/// @param style 布局样式
/// @param space 间距
- (void)layoutButtonWithEdgeInsetsStyle:(MKButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
