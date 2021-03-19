//
//  LoginViewController.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "LoginViewController.h"
//IP管理系统
#import "ZYIPManagerViewController.h"
static NSString *openPassword = @"zy123456"; // 总密码
static NSString *currentPassword = @"111111";// 临时密码
static NSInteger passDate = 7 * 24 * 60 * 60 + 1579406199; // 临时密码7天过期

@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark -- openIPManager
- (void)openIPManager
{
    UIAlertController *vc = [UIAlertController alertControllerWithTitle:nil message:@"开启系统管理" preferredStyle:UIAlertControllerStyleAlert];
    [vc addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.placeholder = @"输入系统密码/临时密码";
    }];
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"开启"
                                                       style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSArray *allTextField = vc.textFields;
        UITextField *textField = allTextField.lastObject;
        [self checkOpenPassword:textField.text];
    }];

    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消"
                                                        style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];

    [vc addAction:okAction];
    [vc addAction:cancelAction];
    
    [self presentViewController:vc animated:YES completion:nil];
}

- (void)checkOpenPassword:(NSString *)password
{
    if ([password isEqualToString:openPassword]) { // 管理员密码
        [self addIPManager];
    }else if ([password isEqualToString:currentPassword]) { // 临时密码
        if (timeStamp_10().integerValue < passDate) { // 是否过期
            [self addIPManager];
        }else{
            [SVProgressHUD showInfoWithStatus:@"密码已过期，请联系iOS开发人员"];
        }
    }else{
        [SVProgressHUD showInfoWithStatus:@"密码错误，请联系iOS开发人员"];
    }
}

- (void)addIPManager
{
    ZYIPManagerViewController *zvc = ZYIPManagerViewController.alloc.init;
    zvc.popAction = ^(BaseClassViewController * _Nonnull selfVC) {
        [selfVC removeFromParentViewController];
        [selfVC.view removeFromSuperview];
    };
    [self addChildViewController:zvc];
    [self.view addSubview:zvc.view];
}

@end
