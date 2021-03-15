//
//  UIImageView+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UIImageView+Runtime.h"
#import "UITapGestureRecognizer+Runtime.h"
#import "UILongPressGestureRecognizer+Runtime.h"
#import "XLPhotoBrowser.h"
#import <SDWebImage/SDWebImage.h>
#import "NSString+Runtime.h"

@implementation UIImageView (Runtime)

- (void)addSingleTap:(NSInteger)singleTap singleAction:(void (^)(UITapGestureRecognizer * _Nonnull))taps
{
    UITapGestureRecognizer *tapGestureRecognizer = UITapGestureRecognizer.alloc.init;
    [tapGestureRecognizer setNumberOfTapsRequired:singleTap];
    tapGestureRecognizer.block = ^(UITapGestureRecognizer * _Nonnull tap) {
        taps(tap);
    };
    [self addGestureRecognizer:tapGestureRecognizer];
}

- (void)addLongPressAction:(void (^)(UILongPressGestureRecognizer * _Nonnull))longPress
{
    UILongPressGestureRecognizer *press = UILongPressGestureRecognizer.alloc.init;
    press.block = ^(UILongPressGestureRecognizer * _Nonnull tap) {
        longPress(tap);
    };
    [self addGestureRecognizer:press];
}

+ (void)showScreen:(NSArray *)imgArray selectIndex:(NSInteger)selectIndex isDelete:(BOOL)isDelete
{
    XLPhotoBrowser *browser = [XLPhotoBrowser showPhotoBrowserWithImages:imgArray currentImageIndex:selectIndex isShowDelete:isDelete];
    browser.browserStyle = XLPhotoBrowserStyleIndexLabel;
}

- (void)addCorners:(UIRectCorner)corners cornerRadius:(CGFloat)cornerRadius
{
    self.layer.masksToBounds = YES;
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:CGSizeMake(cornerRadius, cornerRadius)].CGPath;
    self.layer.mask = shapeLayer;
}

- (void)imageWithNetURLString:(NSString *)urlString placeholderImage:(_Nullable id)placeholderImage
{
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if ([placeholderImage isKindOfClass:UIImage.class]) {
            [self sd_setImageWithURL:[NSURL URLWithString:urlString.checkNull] placeholderImage:placeholderImage options:SDWebImageScaleDownLargeImages];
        } else if ([placeholderImage isKindOfClass:NSString.class]){
            [self sd_setImageWithURL:[NSURL URLWithString:urlString.checkNull] placeholderImage:[UIImage imageNamed:([NSString toStringWith:placeholderImage].length == 0 ? @"icon_default" : placeholderImage)] options:SDWebImageScaleDownLargeImages];
        } else {
            [self sd_setImageWithURL:[NSURL URLWithString:urlString.checkNull] placeholderImage:[UIImage imageNamed:@"icon_default"] options:SDWebImageScaleDownLargeImages];
        }
    });
}
@end
