//
//  ZYSheetView.h
//  SGBProject
//
//  Created by zhangyu on 2020/5/12.
//  Copyright © 2020 dtx. All rights reserved.
//

#import "BaseClassView.h"
#import "ZYFuctionModel.h"

@interface ZYSheetView : BaseClassView
@property (nonatomic, strong) void (^closeT) (NSInteger index);
@property (nonatomic, strong) NSMutableArray *infoArray;
@property (nonatomic, strong) void (^clickAction) (ZYFuctionModel *clickModel);
@end
