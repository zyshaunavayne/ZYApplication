//
//  ZYCG_INLINE.h
//  Plorigin
//
//  Created by zhangyu on 2019/8/10.
//  Copyright © 2019 zhangyu. All rights reserved.
//

#ifndef ZYCG_INLINE_h
#define ZYCG_INLINE_h
#import "NSString+Runtime.h"

/// 检测是否为iPhone X系列
CG_INLINE BOOL iPhoneXs()
{
    BOOL x = NO;
    if (@available(iOS 11.0, *)) {
        x = [[UIApplication sharedApplication] delegate].window.safeAreaInsets.bottom > 0.0;
    }
    return x;
}

/// 导航栏高度
CG_INLINE CGFloat navHeight()
{
    return iPhoneXs() ? 88 : 64;
}

/// 导航栏额外高度
CG_INLINE CGFloat navHeightMargin()
{
    return iPhoneXs() ? 24 : 0;
}

/// 底部安全距离
CG_INLINE CGFloat safeBottomMargin()
{
    return iPhoneXs() ? 34. : 0.;
}

/// 时间戳 10位
CG_INLINE NSString *timeStamp_10()
{
    return [NSString stringWithFormat:@"%ld", (long)[NSDate.date timeIntervalSince1970]];
}

/// 时间戳 13位
CG_INLINE NSString *timeStamp_13()
{
    return [NSString stringWithFormat:@"%ld000", (long)[NSDate.date timeIntervalSince1970]];
}

/// 时间戳转年月日时分秒
/// @param timeStamp 时间戳
/// @param type 返回类型
CG_INLINE NSString *showTime(NSInteger timeStamp,NSInteger type)
{
    NSTimeInterval time = timeStamp;
    NSDate *detaildate = [NSDate dateWithTimeIntervalSince1970:time];
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    if (type == 0) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    } else if (type == 1) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    } else if (type == 2) {
        [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    } else if (type == 3) {
        NSTimeInterval now = timeStamp_10().integerValue;
        NSTimeInterval newTime = now - time;
        NSString * mm = [NSString stringWithFormat:@"%.2f",newTime/60];
        NSString * hh = [NSString stringWithFormat:@"%.2f",newTime/60/60];
        NSString * dd = [NSString stringWithFormat:@"%.2f",newTime/60/60/24];
        NSString * MM = [NSString stringWithFormat:@"%.2f",newTime/60/60/24/30];
        NSString * YY = [NSString stringWithFormat:@"%.2f",newTime/60/60/24/365];
        NSString * date;
        if ([MM floatValue] >= 1) {
            if ([YY floatValue] >= 1) {
                [dateFormatter setDateFormat:@"yyyy-MM-dd"];
            }else{
                [dateFormatter setDateFormat:@"MM-dd"];
            }
        }else if ([dd floatValue] >= 1) {
            date = [NSString stringWithFormat:@"%.f天前",[dd floatValue]];
            return date;
        }else if ([hh floatValue] >= 1) {
            date = [NSString stringWithFormat:@"%.f小时前",[hh floatValue]];
            return date;
        }else if ([mm floatValue] >= 1) {
            date = [NSString stringWithFormat:@"%.f分钟前",[mm floatValue]];
            return date;
        }else{
            date = [NSString stringWithFormat:@"%.f秒前",newTime];
            return date;
        }
    } else if (type == 4) {
        NSInteger time = timeStamp - timeStamp_10().integerValue;
        if (time <= 0) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        }else{
            NSInteger day = time / 24 / 60 / 60;
            NSInteger hour = (time % (24 * 60 * 60)) / 3600;
            NSInteger min = ((time % (24 * 60 * 60)) % 3600) / 60;
            NSInteger s = ((time % (24 * 60 * 60)) % 3600) % 60;
            if (day > 0) {
                return [NSString stringWithFormat:@"%ld天%ld时%ld分%ld秒",day,hour,min,s];
            }else{
                if (hour > 0) {
                    return [NSString stringWithFormat:@"%ld时%ld分%ld秒",hour,min,s];
                }else{
                    if (min > 0) {
                        return [NSString stringWithFormat:@"%ld分%ld秒",min,s];
                    }else{
                        return [NSString stringWithFormat:@"%ld秒",s];
                    }
                }
            }
        }
    } else if (type == 5) {
        NSInteger time = timeStamp - timeStamp_10().integerValue;
        
        if (time <= 0) {
            [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
        }else{
            NSInteger day = time / 24 / 60 / 60;
            NSInteger hour = (time % (24 * 60 * 60)) / 3600;
            NSInteger min = ((time % (24 * 60 * 60)) % 3600) / 60;
            if (day > 0) {
                return [NSString stringWithFormat:@"%ld天%ld小时%ld分",day,hour,min];
            }else{
                if (hour > 0) {
                    return [NSString stringWithFormat:@"%ld小时%ld分",hour,min];
                }else{
                    if (min > 0) {
                        return [NSString stringWithFormat:@"%ld分",min];
                    }else{
                        return @"";
                    }
                }
            }
        }
    }
    NSString *currentDateStr = [dateFormatter stringFromDate:detaildate];
    return currentDateStr;
}

/// 宽
CG_INLINE CGFloat SCREEN_WITDH()
{
    return UIScreen.mainScreen.bounds.size.width;
}

/// 高
CG_INLINE CGFloat SCREEN_HEIGHT()
{
    return UIScreen.mainScreen.bounds.size.height;
}

/// 线条高
CG_INLINE CGFloat margin_line()
{
    return 1 / [UIScreen mainScreen].scale;
}

/// 重写CGRect
/// @param x x description
/// @param y y description
/// @param width width description
/// @param height height description
CG_INLINE CGRect CGRect_Make(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    return CGRectMake(x, y, width, height);
}

/// SDAutoLayout + cellViewWidth ()
CG_INLINE CGFloat cellViewWidth()
{
    CGFloat width = SCREEN_WITDH();
    if ([UIApplication sharedApplication].statusBarOrientation != UIInterfaceOrientationPortrait && [[UIDevice currentDevice].systemVersion floatValue] < 8) {
        width = SCREEN_HEIGHT();
    }
    return width;
}

/// 整型转字符串
/// @param string 整型
CG_INLINE NSString *toString(NSInteger string)
{
    return [NSString stringWithFormat:@"%ld",string];
}

/// 演示操作
/// @param parent 父类self
/// @param selectorName 方法名/字符串
/// @param time 时长
CG_INLINE void delayedOperation(id parent, NSString *selectorName, CGFloat time)
{
    [parent performSelector:NSSelectorFromString(selectorName) withObject:nil afterDelay:time];
}

/// 字体大小 8
CG_INLINE UIFont *fontsize_8()
{
    return [UIFont systemFontOfSize:8.0f];
}

/// 字体大小 9
CG_INLINE UIFont *fontsize_9()
{
    return [UIFont systemFontOfSize:9.0f];
}

/// 字体大小 10
CG_INLINE UIFont *fontsize_10()
{
    return [UIFont systemFontOfSize:10.0f];
}

/// 字体大小 11
CG_INLINE UIFont *fontsize_11()
{
    return [UIFont systemFontOfSize:11.0f];
}

/// 字体大小 12
CG_INLINE UIFont *fontsize_12()
{
    return [UIFont systemFontOfSize:12.0f];
}

/// 字体大小 13
CG_INLINE UIFont *fontsize_13()
{
    return [UIFont systemFontOfSize:13.0f];
}

/// 字体大小 14
CG_INLINE UIFont *fontsize_14()
{
    return [UIFont systemFontOfSize:14.0f];
}

/// 字体大小 15
CG_INLINE UIFont *fontsize_15()
{
    return [UIFont systemFontOfSize:15.0f];
}

/// 字体大小 16
CG_INLINE UIFont *fontsize_16()
{
    return [UIFont systemFontOfSize:16.0f];
}

/// 字体大小 17
CG_INLINE UIFont *fontsize_17()
{
    return [UIFont systemFontOfSize:17.0f];
}

/// 字体大小 18
CG_INLINE UIFont *fontsize_18()
{
    return [UIFont systemFontOfSize:18.0f];
}

/// 服务器地址
/// @param url 服务器地址拼接
CG_INLINE NSString *requestMainAddress(NSString *url)
{
    return [NSString stringWithFormat:@"%@%@",@"",url];
}

#endif /* ZYCG_INLINE_h */
