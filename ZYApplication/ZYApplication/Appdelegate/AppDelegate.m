//
//  AppDelegate.m
//  ZYApplication
//
//  Created by zhangyu on 2019/6/14.
//  Copyright © 2019 zhangyu. All rights reserved.
//

#import "AppDelegate.h"
#import "March.h"
//登录页面
#import "LoginViewController.h"
//root
#import "RootHomeTabBarController.h"

@interface AppDelegate ()
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    [self gotoMainVC];
    
    return YES;
}

+ (AppDelegate *)shareInface
{
    return (AppDelegate *) [[UIApplication sharedApplication] delegate];
}

- (void)gotoMainVC
{
    RootHomeTabBarController *rvc = RootHomeTabBarController.alloc.init;
    self.window.rootViewController = rvc;
    [self.window makeKeyAndVisible];
}

- (void)gotoLoginVC
{
    LoginViewController *rvc = LoginViewController.alloc.init;
    self.window.rootViewController = rvc;
    [self.window makeKeyAndVisible];
}

//检测网络
- (void)checkNewWork
{
//    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
//    [[AFNetworkReachabilityManager sharedManager ] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
//        switch (status) {
//            case -1:
//                [ZYSingleton shareSingleton].networkType = @"0";
//                break;
//            case 0:
//                [SVProgressHUD showErrorWithStatus:@"未连接网络"];
//                [ZYSingleton shareSingleton].networkType = @"-1";
//                break;
//            case 1:
//                [ZYSingleton shareSingleton].networkType = @"1";
//                break;
//            case 2:
//                [ZYSingleton shareSingleton].networkType = @"2";
//                break;
//            default:
//                break;
//        }
//        if(status == AFNetworkReachabilityStatusReachableViaWWAN || status == AFNetworkReachabilityStatusReachableViaWiFi)
//        {
//            NSLog(@"有网");
//        }else{
//            [ZYSingleton shareSingleton].networkType = @"-1";
//            [SVProgressHUD showErrorWithStatus:@"未连接网络"];
//            return ;
//        }
//    }];
}

/// 设置键盘
- (void)setKeyBoard
{
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO;
    [IQKeyboardManager sharedManager].shouldResignOnTouchOutside = YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
}


- (void)applicationWillTerminate:(UIApplication *)application {
}


@end

