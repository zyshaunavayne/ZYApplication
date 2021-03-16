//
//  BaseClassCollectionViewCell.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "BaseClassCollectionViewCell.h"

@implementation BaseClassCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;
    }
    return self;
}

@end
