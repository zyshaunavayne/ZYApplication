//
//  NavBaseClassViewController.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseClassViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface NavBaseClassViewController : UINavigationController

/// 当前页面是否为第一级页面
/// @param viewController BaseClassViewController
- (BOOL)NavigationVisiterControllerIsFirstFrontController:(BaseClassViewController *)viewController;

/// 设置默认导航栏
- (void)setNavDefaultsConfig;

/// 设置透明导航栏
- (void)setNavAplhaBackGroundConfig;

@end

NS_ASSUME_NONNULL_END
