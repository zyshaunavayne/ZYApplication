//
//  March.h
//  超凡
//
//  Created by crmzhangyu on 2017/10/9.
//  Copyright © 2017年 crmzhangyu. All rights reserved.
//

#ifndef March_h
#define March_h

//AppDelegate
#import "AppDelegate.h"

//约束布局
#import <SDAutoLayout/SDAutoLayout.h>

//键盘处理 开启关闭
#import <IQKeyboardManager.h>

//category+runtime
#import <objc/runtime.h>
#import "WKWebView+Runtime.h"
#import "UIColor+Runtime.h"
#import "UIFont+Runtime.h"
#import "UIImageView+Runtime.h"
#import "UIImage+Runtime.h"
#import "UIView+Runtime.h"
#import "UILabel+Runtime.h"
#import "UIButton+Runtime.h"
#import "UITextField+Runtime.h"
#import "NSArray+Runtime.h"
#import "NSMutableArray+Runtime.h"
#import "NSDictionary+Runtime.h"
#import "NSMutableDictionary+Runtime.h"
#import "NSString+Runtime.h"
#import "UITapGestureRecognizer+Runtime.h"
#import "UILongPressGestureRecognizer+Runtime.h"

//弹框
#import "JXTAlertTools.h"
#import <SVProgressHUD.h>

//细节处理
#import "ZYDetaileProcessing.h"

#define weak_self __weak typeof(self) weakSelf = self;
#define Strong_Self __strong typeof(self) strongSelf = self;
#define set_NSMutableDictionary NSMutableDictionary *proDic = [[NSMutableDictionary alloc] init];
#define weak_self__set_NSMutableDictionary weak_self set_NSMutableDictionary

#ifdef DEBUG
#define DLog(s, ...) printf("class: <%p %s:(%d) > method: %s \n%s\n", self, [[[NSString stringWithUTF8String:__FILE__] lastPathComponent] UTF8String], __LINE__, __PRETTY_FUNCTION__, [[NSString stringWithFormat:(s), ##__VA_ARGS__] UTF8String] )
#define NSLog(...) NSLog(__VA_ARGS__);
#else
#define DLog(...)
#define NSLog(...)
#endif

#import "ZYCG_INLINE.h"

#endif /* March_h */

