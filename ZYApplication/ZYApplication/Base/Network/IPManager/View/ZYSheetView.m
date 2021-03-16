//
//  ZYSheetView.m
//  SGBProject
//
//  Created by zhangyu on 2020/5/12.
//  Copyright © 2020 dtx. All rights reserved.
//

#import "ZYSheetView.h"
#import "ZYSheetCell.h"

@interface ZYSheetView ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIButton *cancleBtn;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UIView *lineAView;
@property (nonatomic, strong) UIView *lineBView;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIButton *allBtn;
@end
@implementation ZYSheetView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.clearColor;
        
        [self addSubview:self.cancleBtn];
        [self addSubview:self.lineView];
        [self addSubview:self.lineAView];
        [self addSubview:self.lineBView];
        [self addSubview:self.tableView];
        [self addSubview:self.allBtn];
    }
    return self;
}

- (void)setInfoArray:(NSMutableArray *)infoArray
{
    _infoArray = infoArray;
    
    _cancleBtn.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .bottomSpaceToView(self, 0)
    .heightIs(44);
    
    _lineView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .bottomSpaceToView(_cancleBtn, 0)
    .heightIs(margin_line());
    
    _lineAView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .bottomSpaceToView(_lineView, 0)
    .heightIs(10);
    
    _lineBView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .bottomSpaceToView(_lineAView, 0)
    .heightIs(margin_line());
    
    NSInteger index = _infoArray.count;
    if (index >= 6) {
        index = 6;
    }
    [_tableView reloadData];
    _tableView.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .bottomSpaceToView(_lineBView, - margin_line())
    .heightIs(44 * index);
    
    _allBtn.sd_layout
    .leftSpaceToView(self, 0)
    .rightSpaceToView(self, 0)
    .topSpaceToView(self, 0)
    .bottomSpaceToView(_tableView, 0);
}

- (UIButton *)cancleBtn
{
    if (!_cancleBtn) {
        _cancleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _cancleBtn.backgroundColor = UIColor.whiteColor;
        [_cancleBtn setTitle:@"取消" forState:0];
        [_cancleBtn setTitleColor:UIColor.Text_Gray forState:0];
        _cancleBtn.titleLabel.font = fontsize_15();
        weak_self
        _cancleBtn.block = ^(UIButton * _Nonnull btn) {
            [weakSelf cancleBtnTouchInside];
        };
    }
    return _cancleBtn;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = UIColor.Line;
    }
    return _lineView;
}

- (UIView *)lineBView
{
    if (!_lineBView) {
        _lineBView = [[UIView alloc] init];
        _lineBView.backgroundColor = UIColor.Line;
    }
    return _lineBView;
}

- (UIView *)lineAView
{
    if (!_lineAView) {
        _lineAView = [[UIView alloc] init];
        _lineAView.backgroundColor = UIColor.Background_Color;
    }
    return _lineAView;
}

- (UIButton *)allBtn
{
    if (!_allBtn) {
        _allBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _allBtn.backgroundColor = [UIColor blackColor];
        _allBtn.alpha = 0.3;
        weak_self
        _allBtn.block = ^(UIButton * _Nonnull btn) {
            [weakSelf allBtnTouchInside];
        };
    }
    return _allBtn;
}

- (void)allBtnTouchInside
{
    if (self.closeT) {
        _closeT(1);
    }
}

- (void)cancleBtnTouchInside
{
    [self allBtnTouchInside];
}

#pragma mark -- 协议
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _infoArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYSheetCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYSheetCell"];
    if (!cell) {
        cell = [[ZYSheetCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZYSheetCell"];
    }
    cell.model = _infoArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (self.clickAction) {
        _clickAction(_infoArray[indexPath.row]);
    }
}

#pragma mark -- 懒加载
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.backgroundColor = UIColor.whiteColor;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.showsVerticalScrollIndicator = NO;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [self tableViewNoJump:_tableView];
    }
    return _tableView;
}

@end
