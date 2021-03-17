//
//  ZYApplicationNetwork.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "ZYApplicationNetwork.h"
#import "ZYIPManagerModel.h"
#import "ZYDetaileProcessing.h"

@implementation ZYApplicationNetwork

+ (void)getMainAddress
{
    [ZYDetaileProcessing DPRemoveUserDefaultWithKey:@"getMainAddress"];
    
    if ([[ZYDetaileProcessing DPArchiveInfoWithKey:@"getMainAddress"] isKindOfClass:NSArray.class]) {
        for (NSDictionary *obj in [ZYDetaileProcessing DPArchiveInfoWithKey:@"getMainAddress"]) {
            ZYIPManagerModel *model = [ZYIPManagerModel.alloc initWithDictionary:obj];
            if (model.select == 1) {
//                ZYSingleton.shareSingleton.mainAddress = model.url;
                break;
            }
        }
    }else{
        NSMutableArray *array = NSMutableArray.new;
        ZYIPManagerModel *model1 = ZYIPManagerModel.alloc.init;
        model1.name = @"正式环境";
        model1.url = @"http://cityrecord.ibtop.cn:18085/city_record";
        model1.select = 1;
        [array addObject:model1.toDictionary];
        
        ZYIPManagerModel *model2 = ZYIPManagerModel.alloc.init;
        model2.name = @"测试环境";
        model2.url = @"http://cityrecord.ibtop.cn:18085/city_record";
        model2.select = 0;
        [array addObject:model2.toDictionary];
    
        for (NSDictionary *obj in array) {
            ZYIPManagerModel *model = [ZYIPManagerModel.alloc initWithDictionary:obj];
            if (model.select == 1) {
//                ZYSingleton.shareSingleton.mainAddress = model.url;
                break;
            }
        }
        [ZYDetaileProcessing DPSaveInfoWithValue:array key:@"getMainAddress"];
    }
}

@end
