//
//  ZYSingleton.m
//  CityArchives
//
//  Created by 张宇 on 2021/3/18.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "ZYSingleton.h"

@implementation ZYSingleton

static ZYSingleton *instance = nil;

+ (instancetype)shareSingleton {
    return [[self alloc] init];
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    if (instance == nil) {
        static dispatch_once_t onceToken;
        dispatch_once(&onceToken, ^{
            instance = [super allocWithZone:zone];
        });
    }
    return instance;
}

- (instancetype)init {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [super init];
    });
    return instance;
}

@end
