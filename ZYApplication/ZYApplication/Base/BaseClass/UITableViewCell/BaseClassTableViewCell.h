//
//  BaseClassTableViewCell.h
//  ZYApplication
//
//  Created by 张宇 on 2021/3/15.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseClassTableViewCell : UITableViewCell

/// 禁止tableView滑动时跳动
/// @param tableView tableView
- (void)tableViewNoJump:(UITableView *)tableView;

@end

NS_ASSUME_NONNULL_END
