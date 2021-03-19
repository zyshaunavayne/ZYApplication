//
//  ZYDetaileProcessing.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZYDetaileProcessing : NSObject

/// 获取当前屏幕显示的viewcontroller
+ (UIViewController *)getCurrentVC;

/// 强制获取当前UI控件所在的页面 性能较低
/// @param view UIView、UILabel、Uibutton、UITableView等子控件
+ (UIViewController *)getViewCurrentVCFromView:(id)view;

/// 获取当前UI控件在父类vc上的相对位置和大小
/// @param view UIView、UILabel、Uibutton、UITableView等子控件
+ (CGRect)getViewRectInCurrentVCFromView:(id)view;

/// 获取当前UI控件在父类vc上的相对位置的中心点位置
/// @param view UIView、UILabel、Uibutton、UITableView等子控件
+ (CGPoint)getViewPointInCurrentVCFromView:(id)view;

/// 缓存数据
/// @param value value description
/// @param key key description
+ (void)DPSaveInfoWithValue:(id)value key:(id)key;

/// 移除缓存
/// @param key key description
+ (void)DPRemoveUserDefaultWithKey:(id)key;

/// 读取缓存
/// @param key key description
+ (id)DPArchiveInfoWithKey:(id)key;

/// 转为MD5字符串
/// @param str 字符串
+ (NSString *)toMD5:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
