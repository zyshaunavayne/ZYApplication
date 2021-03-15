//
//  UITapGestureRecognizer+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UITapGestureRecognizer (Runtime)

/// 单击回调
@property (nonatomic, copy) void (^block) (UITapGestureRecognizer *tap);

@end

NS_ASSUME_NONNULL_END
