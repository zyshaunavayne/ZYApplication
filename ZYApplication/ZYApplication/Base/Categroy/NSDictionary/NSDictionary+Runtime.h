//
//  NSDictionary+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSDictionary (Runtime)

/// 转换为字典
/// @param data 内容
+ (NSDictionary *)toDic:(id)data;

@end

NS_ASSUME_NONNULL_END
