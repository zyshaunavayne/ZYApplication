//
//  UIImage+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIImage (Runtime)

/// 通过图片名加载图片
/// @param name 图片名
+ (UIImage *)imageWithName:(NSString *)name;

/// 通过路径加载图片
/// @param path 路径
+ (UIImage *)imageWithPath:(NSString *)path;

@end

NS_ASSUME_NONNULL_END
