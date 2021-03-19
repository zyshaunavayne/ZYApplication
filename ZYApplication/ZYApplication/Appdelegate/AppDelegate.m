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
#import "LoginRequest.h"

@interface AppDelegate ()
@property (nonatomic, strong) LoginRequest *loginRequest;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];

    [UIApplication sharedApplication].applicationIconBadgeNumber = 0;
    
    //配置服务器
    [ZYApplicationNetwork getMainAddress];
    
    //设置根控制器
    [self gotoMainVC];
    
    NSMutableDictionary *dic = NSMutableDictionary.alloc.init;
    [dic setObject:@"zhangyu" forKey:@"username"];
    [dic setObject:[ZYDetaileProcessing toMD5:@"1223456"] forKey:@"password"];
    [dic setObject:@"auth=s" forKey:@"deviceId"];
    [self.loginRequest beginLogin:dic];
    
    return YES;
}

- (LoginRequest *)loginRequest
{
    if (!_loginRequest) {
        _loginRequest = LoginRequest.alloc.init;
        _loginRequest.successResponse = ^(ZYAppNetWork * _Nullable success) {
            [SVProgressHUD showErrorWithStatus:[success.responseData.faileResponse objectForKey:@"result"]];
        };
        
        _loginRequest.faileResponse = ^(ZYAppNetWork * _Nullable faile) {
            [SVProgressHUD showErrorWithStatus:[faile.responseData.faileResponse objectForKey:@"result"]];
        };
    }
    return _loginRequest;
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

