//
//  NSString+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (Runtime)

/// 为空时替换为 “”
@property (nonatomic, strong) id checkNull;

/// 为空时替换为 " "
@property (nonatomic, strong) id checkNull_Space;

/// 检测是否为手机号
@property (nonatomic, assign) BOOL mobilePhone;

/// 转字符串
/// @param obj obj
+ (NSString *)toStringWith:(id)obj;

/// 字典转json字符串
/// @param dic 字典
+ (NSString *)toJsonStringWithDic:(NSDictionary *)dic;

@end

NS_ASSUME_NONNULL_END
