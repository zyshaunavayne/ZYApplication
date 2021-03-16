//
//  RootHomeTabBarController.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "RootHomeTabBarController.h"
#import "NavBaseClassViewController.h"

//登录页
#import "LoginViewController.h"
//首页
#import "HomePageViewController.h"
//我的页面
#import "MyViewController.h"

@interface RootHomeTabBarController () <UITabBarControllerDelegate>

@end

@implementation RootHomeTabBarController

- (void)addUI
{
    self.view.backgroundColor = UIColor.whiteColor;
    
    [self initTabBarItem:@"首页" normolImage:@"" selectImage:@"" navViewController:[NavBaseClassViewController.alloc initWithRootViewController:HomePageViewController.alloc.init]];
    
    [self initTabBarItem:@"我的" normolImage:@"" selectImage:@"" navViewController:[NavBaseClassViewController.alloc initWithRootViewController:MyViewController.alloc.init]];
}


/// 设置初始化子类
/// @param title 名称
/// @param normolImage 图片
/// @param selectImage 被选中图片
/// @param navViewController nav
- (void)initTabBarItem:(NSString *)title
           normolImage:(NSString *)normolImage
           selectImage:(NSString *)selectImage
     navViewController:(NavBaseClassViewController *)navViewController
{
    //文本
    navViewController.tabBarItem.title = title;
    
    //未选中图片颜色
    navViewController.tabBarItem.image = [[UIImage imageNamed:normolImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    //未选中字体颜色
    [navViewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:[UIColor RGB:51] forKey:NSForegroundColorAttributeName] forState:UIControlStateNormal];
    
    //选中图片颜色
    [navViewController.tabBarItem setSelectedImage:[[UIImage imageNamed:selectImage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    //选中字体颜色
    [navViewController.tabBarItem setTitleTextAttributes:[NSDictionary dictionaryWithObject:UIColor.Text_Theme forKey:NSForegroundColorAttributeName] forState:UIControlStateSelected];
    [navViewController.tabBarItem  setTitlePositionAdjustment:UIOffsetMake(0, 0)];
    
    //去掉tabBar顶部线条
    CGRect rect = CGRectMake(0, 0, SCREEN_WITDH(), 49);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
    CGContextFillRect(context, rect);
    UIImage *img = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    [self.tabBar setBackgroundImage:img];
    [self.tabBar setShadowImage:img];
    
    //底部背景色
    self.tabBar.backgroundColor = UIColor.whiteColor;
    
    [self addChildViewController:navViewController];
}

- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    return YES;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.selectedIndex = 0;
    [self addUI];
}

@end
