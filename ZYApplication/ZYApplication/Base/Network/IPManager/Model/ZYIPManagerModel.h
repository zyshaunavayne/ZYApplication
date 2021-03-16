//
//  ZYIPManagerModel.h
//  SGBProject
//
//  Created by zhangyu on 2020/5/12.
//  Copyright © 2020 dtx. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZYIPManagerModel : NSObject

@property (nonatomic, strong) NSString * name;
@property (nonatomic, assign) NSInteger select;
@property (nonatomic, strong) NSString * url; //经营帮App主地址
@property (nonatomic, strong) NSString * qgbUrl; //企管邦App主地址

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
