//
//  UIColor+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UIColor+Runtime.h"

@implementation UIColor (Runtime)

+ (UIColor *)RGB:(NSInteger)RGB
{
    return [self RGB:RGB A:1.];
}

+ (UIColor *)RGB:(NSInteger)RGB A:(float)A
{
    return [UIColor R:RGB G:RGB B:RGB A:A];
}

+ (UIColor *)R:(NSInteger)R G:(NSInteger)G B:(NSInteger)B
{
    return [UIColor colorWithRed:R / 255. green:G / 255. blue:B / 255. alpha:1.];
}

+ (UIColor *)R:(NSInteger)R G:(NSInteger)G B:(NSInteger)B A:(float)A
{
    return [UIColor colorWithRed:R / 255. green:G / 255. blue:B / 255. alpha:A];
}

+ (UIColor *)HEX:(NSString *)Hex
{
    Hex = [Hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    Hex = [Hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    Hex = [Hex stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSRegularExpression *RegEx = [NSRegularExpression regularExpressionWithPattern:@"^[a-fA-F|0-9]{6}$" options:0 error:nil];
    NSUInteger match = [RegEx numberOfMatchesInString:Hex options:NSMatchingReportCompletion range:NSMakeRange(0, Hex.length)];
    
    if (match == 0) {
        return [UIColor clearColor];
    }
    
    NSString *rString = [Hex substringWithRange:NSMakeRange(0, 2)];
    NSString *gString = [Hex substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [Hex substringWithRange:NSMakeRange(4, 2)];
    unsigned int r, g, b;
    BOOL rValue = [[NSScanner scannerWithString:rString] scanHexInt:&r];
    BOOL gValue = [[NSScanner scannerWithString:gString] scanHexInt:&g];
    BOOL bValue = [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (rValue && gValue && bValue) {
        return [self R:r G:g B:b];
    } else {
        return [UIColor clearColor];
    }
}

+ (UIColor *)HEX:(NSString *)Hex A:(float)A
{
    Hex = [Hex stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    Hex = [Hex stringByReplacingOccurrencesOfString:@"#" withString:@""];
    Hex = [Hex stringByReplacingOccurrencesOfString:@"0x" withString:@""];
    NSRegularExpression *RegEx = [NSRegularExpression regularExpressionWithPattern:@"^[a-fA-F|0-9]{6}$" options:0 error:nil];
    NSUInteger match = [RegEx numberOfMatchesInString:Hex options:NSMatchingReportCompletion range:NSMakeRange(0, Hex.length)];
    
    if (match == 0) {
        return [UIColor clearColor];
    }
    
    NSString *rString = [Hex substringWithRange:NSMakeRange(0, 2)];
    NSString *gString = [Hex substringWithRange:NSMakeRange(2, 2)];
    NSString *bString = [Hex substringWithRange:NSMakeRange(4, 2)];
    unsigned int r, g, b;
    BOOL rValue = [[NSScanner scannerWithString:rString] scanHexInt:&r];
    BOOL gValue = [[NSScanner scannerWithString:gString] scanHexInt:&g];
    BOOL bValue = [[NSScanner scannerWithString:bString] scanHexInt:&b];
    
    if (rValue && gValue && bValue) {
        return [self R:r G:g B:b A:A];
    } else {
        return [UIColor clearColor];
    }
}

+ (UIColor *)Line
{
    return [self RGB:230 A:1.];
}

+ (UIColor *)Background_Color
{
    return [self RGB:246 A:1.];
}

+ (UIColor *)Text_Theme
{
    return [self R:87 G:146 B:253];
}

+ (UIColor *)Text_Black
{
    return [self RGB:51];
}

+ (UIColor *)Text_Gray
{
    return [self RGB:153];
}

@end
