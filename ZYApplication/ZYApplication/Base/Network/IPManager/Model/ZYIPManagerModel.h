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
@property (nonatomic, strong) NSString * url; 

-(instancetype)initWithDictionary:(NSDictionary *)dictionary;

-(NSDictionary *)toDictionary;
@end
