//
//  ZYApplicationNetwork.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "ZYNetWorkBaseRequestBlock.h"
#import "ZYNetWork.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYApplicationNetwork : ZYNetWorkBaseRequestBlock

/// 获取项目服务器地址
+ (void)getMainAddress;

@end

NS_ASSUME_NONNULL_END
