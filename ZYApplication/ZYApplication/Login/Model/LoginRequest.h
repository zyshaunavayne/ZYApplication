//
//  LoginRequest.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/19.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "ZYNetWorkBaseRequestBlock.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginRequest : ZYNetWorkBaseRequestBlock

/// 开启登录
/// @param parameters 入参
- (void)beginLogin:(id)parameters;

@end

NS_ASSUME_NONNULL_END
