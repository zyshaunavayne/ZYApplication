//
//  WebBaseClassViewController.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "WebBaseClassViewController.h"
#import "WKWebView+Runtime.h"

@interface WebBaseClassViewController () <WKUIDelegate,WKNavigationDelegate>
@property (nonatomic, strong) WKWebView *wkWebView;
@end

@implementation WebBaseClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view addSubview:self.wkWebView];
    _wkWebView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, 0)
    .bottomSpaceToView(self.view, 0);
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.wkWebView loadURLString:self.parameters];
}

- (WKWebView *)wkWebView
{
    if (!_wkWebView) {
        _wkWebView = WKWebView.alloc.init;
    }
    return _wkWebView;
}

@end
