//
//  AppDelegate.h
//  ZYApplication
//
//  Created by zhangyu on 2019/6/14.
//  Copyright © 2019 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>
+ (AppDelegate *) shareInface;
- (void)gotoMainVC;
- (void)gotoLoginVC;
@property (strong, nonatomic) UIWindow *window;


@end

