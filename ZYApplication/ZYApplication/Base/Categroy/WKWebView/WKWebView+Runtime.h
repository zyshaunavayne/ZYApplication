//
//  WKWebView+Runtime.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface WKWebView (Runtime)

/// 加载 缓存读取/刷新到最新网页
/// @param urlString urlString
- (void)loadURLString:(NSString *)urlString;

@end

NS_ASSUME_NONNULL_END
