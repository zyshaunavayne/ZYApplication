//
//  BaseClassViewController.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "March.h"

NS_ASSUME_NONNULL_BEGIN

@interface BaseClassViewController : UIViewController

/// 页面入参 仅此一个
@property (nonatomic, strong) id parameters;

/// 顶部横线
@property (nonatomic, strong) UIView *topLineView;

#pragma mark -- 顶部视图

/// 设置左侧按钮 图片
/// @param path 图片名
- (void)setPageLeftBtnByImagePath:(NSString *)path;

/// 设置左侧按钮 字符串
/// @param name 字符串
- (void)setPageLeftBtnByName:(NSString *)name;

/// 设置右侧按钮 图片
/// @param path 图片名
- (void)setPageRightBtnByImagePath:(NSString *)path;

/// 设置右侧按钮 字符串
/// @param name 字符串
- (void)setPageRightBtnByName:(NSString *)name;

#pragma mark -- 返回/push/点击

/// 返回上级页面 左侧按钮点击事件
- (void)popToLastPage;

/// 通过nav、push到新的页面
/// @param vc 新页面
/// @param animation 是否需要动画
/// @param hidden 是否需要隐藏tabbar
- (void)push:(BaseClassViewController *)vc animation:(BOOL)animation andIsHiddenTabbar:(BOOL)hidden;

/// 右侧点击事件
/// @param sender 按钮
- (void)rightBtnAction:(UIButton *)sender;

/// 禁止tableView滑动时跳动
/// @param tableView tableView
- (void)tableViewNoJump:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
