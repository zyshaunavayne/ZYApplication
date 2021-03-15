//
//  NSString+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "NSString+Runtime.h"
#import <objc/runtime.h>

@implementation NSString (Runtime)

#pragma mark -- checkNull
- (NSString *)checkNull
{
    return objc_getAssociatedObject(self, @"checkNull");
}

- (void)setCheckNull:(NSString *)checkNull
{
    objc_setAssociatedObject(self, @"checkNull", checkNull, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if ([self isKindOfClass:[NSNumber class]]) {
        self.checkNull = [self description];
    } else if (self.length == 0 || self == nil || self == NULL || [self isKindOfClass:[NSNull class]] || [self isEqualToString:@"<null>"]) {
        self.checkNull = @"";
    }
}

#pragma mark -- checkNull_Space
- (id)checkNull_Space
{
    return objc_getAssociatedObject(self, @"checkNull_Space");
}

- (void)setCheckNull_Space:(id)checkNull_Space
{
    objc_setAssociatedObject(self, @"checkNull_Space", checkNull_Space, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
    if ([self isKindOfClass:[NSNumber class]]) {
        self.checkNull_Space = [self description];
    } else if (self.length == 0 || self == nil || self == NULL || [self isKindOfClass:[NSNull class]] || [self isEqualToString:@"<null>"]) {
        self.checkNull_Space = @" ";
    }
}

#pragma mark -- mobilePhone
- (BOOL)mobilePhone
{
    return objc_getAssociatedObject(self, @"mobilePhone");
}

- (void)setMobilePhone:(BOOL)mobilePhone
{
    objc_setAssociatedObject(self, @"mobilePhone", @(mobilePhone), OBJC_ASSOCIATION_ASSIGN);
    NSString *phoneRegex = @"^((13[0-9])|(15[0-9])|(18[0-9])|(11[0-9])|(16[0-9])|(12[0-9])|(14[0-9])|(17[0-9])|(19[0-9]))\\d{8}$";
    NSPredicate *phoneTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",phoneRegex];
    self.mobilePhone = [phoneTest evaluateWithObject:self];
}

+ (NSString *)toStringWith:(id)obj
{
    return [NSString stringWithFormat:@"%@",obj].checkNull;
}

+ (NSString *)toJsonStringWithDic:(NSDictionary *)dic
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&error];
    NSString *jsonString;
    if (!jsonData) {
    }else{
        jsonString = [[NSString alloc]initWithData:jsonData encoding:NSUTF8StringEncoding];
    }
    NSMutableString *mutStr = [NSMutableString stringWithString:jsonString];
    NSRange range = {0,jsonString.length};
    [mutStr replaceOccurrencesOfString:@" " withString:@"" options:NSLiteralSearch range:range];
    NSRange range2 = {0,mutStr.length};
    [mutStr replaceOccurrencesOfString:@"\n" withString:@"" options:NSLiteralSearch range:range2];
    return mutStr;
}

@end
