//
//  ZYIPManagerViewController.h
//  SGBProject
//
//  Created by zhangyu on 2020/5/12.
//  Copyright © 2020 dtx. All rights reserved.
//

#import "BaseClassViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZYIPManagerViewController : BaseClassViewController
@property (nonatomic, strong) void (^popAction) (BaseClassViewController *selfVC);
@end

NS_ASSUME_NONNULL_END
