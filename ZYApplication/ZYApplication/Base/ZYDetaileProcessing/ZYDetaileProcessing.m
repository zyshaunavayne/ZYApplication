//
//  ZYDetaileProcessing.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "ZYDetaileProcessing.h"
#import <CommonCrypto/CommonDigest.h>

@implementation ZYDetaileProcessing

+ (UIViewController *)getCurrentVC
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *currentVC = [self getCurrentVCFrom:rootViewController];
    return currentVC;
}

+ (UIViewController *)getCurrentVCFrom:(UIViewController *)rootVC
{
    UIViewController *currentVC;
    if ([rootVC presentedViewController]) {
        rootVC = [rootVC presentedViewController];
    }
    if ([rootVC isKindOfClass:[UITabBarController class]]) {
        currentVC = [self getCurrentVCFrom:[(UITabBarController *)rootVC selectedViewController]];
    } else if ([rootVC isKindOfClass:[UINavigationController class]]){
        currentVC = [self getCurrentVCFrom:[(UINavigationController *)rootVC visibleViewController]];
    } else {
        currentVC = rootVC;
    }
    return currentVC;
}

+ (UIViewController *)getViewCurrentVCFromView:(id)view
{
    if (!view) {
        return nil;
    }
        
    UIViewController *result = nil;
    UIWindow *window = UIApplication.sharedApplication.keyWindow;
    if(window.windowLevel != UIWindowLevelNormal) {
        NSArray *windows = UIApplication.sharedApplication.windows;
        for(UIWindow *tmpWin in windows) {
            if(tmpWin.windowLevel == UIWindowLevelNormal) {
                window = tmpWin;
                break;
            }
        }
    }
    id nextResponder = [view nextResponder];
    if ([nextResponder isKindOfClass:[UIViewController class]]) {
        result = nextResponder;
    } else if ([nextResponder isKindOfClass:[UIView class]] || [nextResponder isKindOfClass:[UIButton class]] || [nextResponder isKindOfClass:[UILabel class]] || [nextResponder isKindOfClass:[UIImageView class]] || [nextResponder isKindOfClass:[UITableView class]] || [nextResponder isKindOfClass:[UIScrollView class]] || [nextResponder isKindOfClass:[UICollectionView class]] || [nextResponder isKindOfClass:[UICollectionViewCell class]] || [nextResponder isKindOfClass:[UITableViewCell class]] || [nextResponder isKindOfClass:[UITableViewHeaderFooterView class]] || [nextResponder isKindOfClass:[UITableViewHeaderFooterView class]]) {
        result = [self getViewCurrentVCFromView:nextResponder];
    } else {
        result = nil;
    }
    return result;
}

+ (CGRect)getViewRectInCurrentVCFromView:(id)view
{
    UIViewController *vc = [self getViewCurrentVCFromView:view];
    UIView *currentView = (UIView *)view;
    CGRect rect= [currentView convertRect:currentView.bounds toView:vc.view];
    return  rect;
}

+ (CGPoint)getViewPointInCurrentVCFromView:(id)view
{
    CGRect rect = [self getViewRectInCurrentVCFromView:view];
    CGPoint point = CGPointMake(rect.origin.x + rect.size.width / 2., rect.origin.y + rect.size.height / 2.);
    return point;
}

+ (void)DPSaveInfoWithValue:(id)value key:(id)key
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:key];
    NSData *saveData = [NSKeyedArchiver archivedDataWithRootObject:value];
    [saveData writeToFile:path atomically:NO];
}

+ (void)DPRemoveUserDefaultWithKey:(id)key
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:key];
    [[NSFileManager defaultManager] removeItemAtPath:path error:nil];
}

+ (id)DPArchiveInfoWithKey:(id)key
{
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES).firstObject stringByAppendingPathComponent:key];
    return [NSKeyedUnarchiver unarchiveObjectWithFile:path];
}

+ (NSString *)toMD5:(NSString *)str
{
    const char *cStr = [str UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (unsigned int)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

@end
