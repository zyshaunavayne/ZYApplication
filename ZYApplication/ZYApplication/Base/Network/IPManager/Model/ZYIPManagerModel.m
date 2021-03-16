//
//  ZYIPManagerModel.m
//  SGBProject
//
//  Created by zhangyu on 2020/5/12.
//  Copyright © 2020 dtx. All rights reserved.
//

//
//    ZYIPManagerModel.m
//    Model file generated using JSONExport: https://github.com/Ahmed-Ali/JSONExport



#import "ZYIPManagerModel.h"

NSString *const kZYIPManagerModelName = @"name";
NSString *const kZYIPManagerModelSelect = @"select";
NSString *const kZYIPManagerModelUrl = @"url";
NSString *const kZYIPManagerModelQGBUrl = @"qgbUrl";

@interface ZYIPManagerModel ()
@end
@implementation ZYIPManagerModel




/**
 * Instantiate the instance using the passed dictionary values to set the properties values
 */

-(instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if(![dictionary[kZYIPManagerModelName] isKindOfClass:[NSNull class]]){
        self.name = dictionary[kZYIPManagerModelName];
    }
    if(![dictionary[kZYIPManagerModelSelect] isKindOfClass:[NSNull class]]){
        self.select = [dictionary[kZYIPManagerModelSelect] integerValue];
    }

    if(![dictionary[kZYIPManagerModelUrl] isKindOfClass:[NSNull class]]){
        self.url = dictionary[kZYIPManagerModelUrl];
    }
    if(![dictionary[kZYIPManagerModelQGBUrl] isKindOfClass:[NSNull class]]){
        self.qgbUrl = dictionary[kZYIPManagerModelQGBUrl];
    }
    return self;
}


/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
-(NSDictionary *)toDictionary
{
    NSMutableDictionary * dictionary = [NSMutableDictionary dictionary];
    if(self.name != nil){
        dictionary[kZYIPManagerModelName] = self.name;
    }
    dictionary[kZYIPManagerModelSelect] = @(self.select);
    if(self.url != nil){
        dictionary[kZYIPManagerModelUrl] = self.url;
    }
    if(self.qgbUrl != nil){
        dictionary[kZYIPManagerModelQGBUrl] = self.qgbUrl;
    }
    return dictionary;

}

/**
 * Implementation of NSCoding encoding method
 */
/**
 * Returns all the available property values in the form of NSDictionary object where the key is the approperiate json key and the value is the value of the corresponding property
 */
- (void)encodeWithCoder:(NSCoder *)aCoder
{
    if(self.name != nil){
        [aCoder encodeObject:self.name forKey:kZYIPManagerModelName];
    }
    [aCoder encodeObject:@(self.select) forKey:kZYIPManagerModelSelect];
    if(self.url != nil){
        [aCoder encodeObject:self.url forKey:kZYIPManagerModelUrl];
    }
    if(self.qgbUrl != nil){
        [aCoder encodeObject:self.qgbUrl forKey:kZYIPManagerModelQGBUrl];
    }
}

/**
 * Implementation of NSCoding initWithCoder: method
 */
- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super init];
    self.name = [aDecoder decodeObjectForKey:kZYIPManagerModelName];
    self.select = [[aDecoder decodeObjectForKey:kZYIPManagerModelSelect] integerValue];
    self.url = [aDecoder decodeObjectForKey:kZYIPManagerModelUrl];
    self.qgbUrl = [aDecoder decodeObjectForKey:kZYIPManagerModelQGBUrl];
    return self;

}

/**
 * Implementation of NSCopying copyWithZone: method
 */
- (instancetype)copyWithZone:(NSZone *)zone
{
    ZYIPManagerModel *copy = [ZYIPManagerModel new];

    copy.name = [self.name copy];
    copy.select = self.select;
    copy.url = [self.url copy];
    copy.qgbUrl = [self.qgbUrl copy];

    return copy;
}
@end
