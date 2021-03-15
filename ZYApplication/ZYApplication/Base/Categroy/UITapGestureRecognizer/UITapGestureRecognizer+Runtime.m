//
//  UITapGestureRecognizer+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UITapGestureRecognizer+Runtime.h"
#import <objc/runtime.h>

@implementation UITapGestureRecognizer (Runtime)

- (void)setBlock:(void (^)(UITapGestureRecognizer * _Nonnull))block
{
    objc_setAssociatedObject(self, @selector(block),block,OBJC_ASSOCIATION_COPY_NONATOMIC);
    [self addTarget:self action:@selector(click:)];
}

- (void (^) (UITapGestureRecognizer *))block
{
    return objc_getAssociatedObject(self, @selector(block));
}

- (void)click:(UITapGestureRecognizer *)tap
{
    if (self.block) {
        self.block(tap);
    }
}

@end
