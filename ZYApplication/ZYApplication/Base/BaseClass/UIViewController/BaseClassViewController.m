//
//  BaseClassViewController.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "BaseClassViewController.h"
#import "NavBaseClassViewController.h"

@interface BaseClassViewController ()
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIButton *rightBtn;
@end

@implementation BaseClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    self.navigationController.navigationBarHidden = NO;
    
    [self.view addSubview:self.topLineView];
    _topLineView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .heightIs(5);
}

- (UIView *)topLineView
{
    if (!_topLineView) {
        _topLineView = UIView.alloc.init;
        _topLineView.hidden = YES;
        _topLineView.backgroundColor = UIColor.Background_Color;
    }
    return _topLineView;
}

- (void)setPageLeftBtnByImagePath:(NSString *)path
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithImage:[UIImage imageNamed:path] style:UIBarButtonItemStylePlain target:self action:@selector(popToLastPage)];
}

- (void)setPageLeftBtnByName:(NSString *)name
{
    [self.leftBtn removeFromSuperview];
    self.leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    CGFloat width = 33;
    self.leftBtn.frame = CGRectMake(0, 0, width + 33, 33);
    [self.leftBtn setTitle:[NSString stringWithFormat:@"  %@",name] forState:UIControlStateNormal];
    [self.leftBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.leftBtn.titleLabel.font = fontsize_17();
    UIBarButtonItem *leftButton = [UIBarButtonItem.alloc initWithCustomView:self.leftBtn];
    [self.leftBtn addTarget:self action:@selector(popToLastPage) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItems = @[leftButton];
}

- (void)setPageRightBtnByImagePath:(NSString *)path
{
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem.alloc initWithImage:[UIImage imageNamed:path] style:UIBarButtonItemStylePlain target:self action:@selector(rightBtnAction:)];
}

- (void)setPageRightBtnByName:(NSString *)name
{
    [self.rightBtn removeFromSuperview];
    self.rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];

    CGFloat width = 33;
    self.rightBtn.frame = CGRectMake(0, 0, width + 33, 33);
    [self.rightBtn setTitle:[NSString stringWithFormat:@"  %@",name] forState:UIControlStateNormal];
    [self.rightBtn setTitleColor:UIColor.whiteColor forState:UIControlStateNormal];
    self.rightBtn.titleLabel.font = fontsize_17();
    UIBarButtonItem *leftButton = [UIBarButtonItem.alloc initWithCustomView:self.rightBtn];
    [self.rightBtn addTarget:self action:@selector(rightBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItems = @[leftButton];
}

- (void)popToLastPage
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)push:(BaseClassViewController *)vc animation:(BOOL)animation andIsHiddenTabbar:(BOOL)hidden
{
    NavBaseClassViewController *baseNavi = (NavBaseClassViewController *)self.navigationController;
    BOOL isFirstFront = [baseNavi NavigationVisiterControllerIsFirstFrontController:self];
    if (isFirstFront) {
        if (hidden) {
            self.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:vc animated:animation];
            self.hidesBottomBarWhenPushed = NO;
        }
    } else {
        self.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:vc animated:animation];
    }
}

- (void)rightBtnAction:(UIButton *)sender
{
    
}

- (void)tableViewNoJump:(UITableView *)tableView
{
    tableView.estimatedRowHeight = 0;
    tableView.estimatedSectionFooterHeight = 0;
    tableView.estimatedSectionHeaderHeight = 0;
}

@end
