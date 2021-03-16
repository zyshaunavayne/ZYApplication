//
//  NavBaseClassViewController.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "NavBaseClassViewController.h"

@interface NavBaseClassViewController ()

@end

@implementation NavBaseClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    self = [super initWithRootViewController:rootViewController];
    if (self) {
        [self setNavDefaultsConfig];
    }
    return self;
}

- (BOOL)NavigationVisiterControllerIsFirstFrontController:(BaseClassViewController *)viewController
{
    BOOL isFirstFront = NO;
    if (viewController) {
        NSArray *viewControllers = self.viewControllers;
        BaseClassViewController *baseVC = viewControllers[0];
        if ([baseVC isKindOfClass:viewController.class]) {
            isFirstFront = YES;
        }
    }
    return isFirstFront;
}

- (void)setNavDefaultsConfig
{
    self.title = @"";
    self.navigationBar.tintColor = UIColor.whiteColor;
    [self.navigationBar setShadowImage:UIImage.new];
    self.navigationBar.barTintColor = UIColor.Text_Theme;
    [self.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17],NSForegroundColorAttributeName:UIColor.whiteColor}];
    self.navigationBar.translucent = NO;
}

- (void)setNavAplhaBackGroundConfig
{
    [self.navigationController.navigationBar setBackgroundImage:UIImage.new forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:UIImage.new];

    UILabel *title = UILabel.alloc.init;
    title.text = @"";
    [title sizeToFit];
    title.textColor = [UIColor colorWithWhite:0 alpha:0];
}

@end
