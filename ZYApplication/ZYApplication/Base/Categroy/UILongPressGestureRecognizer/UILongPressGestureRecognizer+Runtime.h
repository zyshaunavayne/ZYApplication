//
//  UILongPressGestureRecognizer+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UILongPressGestureRecognizer (Runtime)

/// 长按回调
@property (nonatomic, copy) void (^block) (UILongPressGestureRecognizer *longPress);
@end

NS_ASSUME_NONNULL_END
