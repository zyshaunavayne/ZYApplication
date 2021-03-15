//
//  WKWebView+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "WKWebView+Runtime.h"

@interface WKWebView (Runtime) <NSURLSessionDelegate>

@end

@implementation WKWebView (Runtime)

- (void)loadURLString:(NSString *)urlString
{
  urlString = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSURL *url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:10];
    request.HTTPMethod = @"HEAD";
    
    //获取记录的response headers
    NSDictionary *cachedHeaders = [[NSUserDefaults standardUserDefaults] objectForKey:url.absoluteString];
    
    //设置request headers
    if (cachedHeaders) {
        NSString *etag = [cachedHeaders objectForKey:@"Etag"];
        if (etag) {
            [request setValue:etag forHTTPHeaderField:@"If-None-Match"];
        }
        
        NSString *lastModified = [cachedHeaders objectForKey:@"Last-Modified"];
        if (lastModified) {
            [request setValue:lastModified forHTTPHeaderField:@"If-Modified-Since"];
        }
    }
    
    NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration] delegate:self delegateQueue:[NSOperationQueue mainQueue]];
    [[session dataTaskWithRequest:request completionHandler:^(NSData *data, NSURLResponse *response, NSError *error) {
        
        // 类型转换
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        NSLog(@"statusCode == %@", @(httpResponse.statusCode));
            
        // 判断响应的状态码
        if (httpResponse.statusCode == 304 || httpResponse.statusCode == 0) {
            //如果状态码为304或者0(网络不通?)，则设置request的缓存策略为读取本地缓存
            [request setCachePolicy:NSURLRequestReturnCacheDataElseLoad];
        }else {
            //如果状态码为200，则保存本次的response headers，并设置request的缓存策略为忽略本地缓存，重新请求数据
            [[NSUserDefaults standardUserDefaults] setObject:httpResponse.allHeaderFields forKey:request.URL.absoluteString];
            //如果状态码为200，则设置request的缓存策略为忽略本地缓存
            [request setCachePolicy:NSURLRequestReloadIgnoringLocalCacheData];
        }
            
        //未更新的情况下读取缓存
        dispatch_async(dispatch_get_main_queue(), ^{
            //判断结束之后，修改请求方式，加载网页
            request.HTTPMethod = @"GET";
            [self loadRequest:request];
        });
    }] resume];
}

- (void)URLSession:(NSURLSession *)session didReceiveChallenge:(NSURLAuthenticationChallenge *)challenge completionHandler:(void (^)(NSURLSessionAuthChallengeDisposition, NSURLCredential * _Nullable))completionHandler
{
    if([challenge.protectionSpace.authenticationMethod isEqualToString:NSURLAuthenticationMethodServerTrust]){
        NSURLCredential *credential = [[NSURLCredential alloc] initWithTrust:challenge.protectionSpace.serverTrust];
        completionHandler(NSURLSessionAuthChallengeUseCredential, credential);
    }
}

@end
