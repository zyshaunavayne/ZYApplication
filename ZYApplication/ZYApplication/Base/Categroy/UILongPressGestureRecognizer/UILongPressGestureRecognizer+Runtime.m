//
//  UILongPressGestureRecognizer+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UILongPressGestureRecognizer+Runtime.h"
#import <objc/runtime.h>

@implementation UILongPressGestureRecognizer (Runtime)

- (void)setBlock:(void (^)(UILongPressGestureRecognizer * _Nonnull))block
{
    objc_setAssociatedObject(self, @selector(block),block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(click:)];
}

- (void (^) (UILongPressGestureRecognizer *))block
{
    return objc_getAssociatedObject(self, @selector(block));
}

- (void)click:(UILongPressGestureRecognizer *)longPress
{
    if (self.block) {
        self.block(longPress);
    }
}

@end
