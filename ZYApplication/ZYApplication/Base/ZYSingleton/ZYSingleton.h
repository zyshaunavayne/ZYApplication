//
//  ZYSingleton.h
//  CityArchives
//
//  Created by 张宇 on 2021/3/18.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYSingleton : NSObject

+ (instancetype)shareSingleton;

@end

NS_ASSUME_NONNULL_END
