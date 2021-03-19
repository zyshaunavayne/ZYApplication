//
//  LoginRequest.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/19.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "LoginRequest.h"

@interface LoginRequest ()
@property (nonatomic, strong) ZYAppNetWork *loginRequest;
@end

@implementation LoginRequest

- (ZYAppNetWork *)loginRequest
{
    if (!_loginRequest) {
        _loginRequest = ZYAppNetWork.alloc.init;
        _loginRequest.requestUrl = request_MainAddress(@"/api/user/login");
        _loginRequest.delegate = self.requestDelegate;
    }
    return _loginRequest;
}

- (void)beginLogin:(id)parameters
{
    self.loginRequest.parameters = parameters;
    [self.loginRequest startRequest];
}

@end
