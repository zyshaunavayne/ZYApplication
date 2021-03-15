//
//  NSDictionary+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "NSDictionary+Runtime.h"

@implementation NSDictionary (Runtime)

+ (NSDictionary *)toDic:(id)data
{
    NSDictionary *dictionary = nil;
    if ([data isKindOfClass:NSDictionary.class]) {
        dictionary = (NSDictionary*)data;
    }else{
        if (data) {
            dictionary = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:nil];
        }else{
            dictionary = nil;
        }
    }
    
    return dictionary;
}

@end
