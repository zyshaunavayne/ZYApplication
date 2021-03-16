//
//  ZYIPManagerViewController.m
//  SGBProject
//
//  Created by zhangyu on 2020/5/12.
//  Copyright © 2020 dtx. All rights reserved.
//

#import "ZYIPManagerViewController.h"
#import "ZYIPManagerCell.h"
#import "ZYSheetView.h"
//#import "mmkv"
@interface ZYIPManagerViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray *tableArray;
@property (nonatomic, strong) ZYSheetView *sheetView;

@property (nonatomic, strong) UITextField *nameTextField;
@property (nonatomic, strong) UITextField *urlTextField;
@end

@implementation ZYIPManagerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"IP管理系统";
    self.view.backgroundColor = UIColor.whiteColor;
        
    [self addNavUI];
    
    [self curretnIP];
    
    [self.view addSubview:self.tableView];
    _tableView.sd_layout
    .leftSpaceToView(self.view, 0)
    .rightSpaceToView(self.view, 0)
    .topSpaceToView(self.view, navHeight())
    .bottomSpaceToView(self.view, navHeightMargin());
}

- (void)addNavUI
{
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageWithName:@"btn_black_back"] forState:0];
    [self.view addSubview:leftBtn];
    leftBtn.sd_layout
    .leftSpaceToView(self.view, 0)
    .widthIs(44).heightIs(44)
    .topSpaceToView(self.view, navHeight() + 20);
    weak_self
    leftBtn.block = ^(UIButton * _Nonnull btn) {
        if (weakSelf.popAction) {
            weakSelf.popAction(weakSelf);
        }
    };
    
    UILabel *titleLabel = UILabel.alloc.init;
    titleLabel.text = @"经营帮IP管理系统";
    titleLabel.font = [UIFont systemFontOfSize:18];
    titleLabel.textColor = [UIColor R:58 G:55 B:49];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:titleLabel];
    titleLabel.sd_layout
    .leftSpaceToView(self.view, 50)
    .rightSpaceToView(self.view, 50)
    .centerYEqualToView(leftBtn)
    .heightIs(22);
}

- (void)curretnIP
{
    _tableArray = NSMutableArray.new;
    
    if ([[ZYDetaileProcessing DPArchiveInfoWithKey:@"getMainAddress"] isKindOfClass:NSArray.class]) {
        for (NSDictionary *obj in [ZYDetaileProcessing DPArchiveInfoWithKey:@"getMainAddress"]) {
            ZYIPManagerModel *model = [ZYIPManagerModel.alloc initWithDictionary:obj];
            [_tableArray addObject:model];
        }
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

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _tableArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 302.5;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *view = UIView.alloc.init;
    view.backgroundColor = UIColor.whiteColor;
    
    UILabel *label = UILabel.alloc.init;
    label.font = fontsize_14();
    label.textColor = UIColor.Text_Black;
    label.text = @"当前选择";
    [view addSubview:label];
    label.sd_layout
    .leftSpaceToView(view, 15)
    .rightSpaceToView(view, 15)
    .topSpaceToView(view, 15)
    .autoHeightRatio(0);
    
    UILabel *nameLabel = UILabel.alloc.init;
    nameLabel.font = fontsize_14();
    nameLabel.textColor = UIColor.Text_Theme;
    [view addSubview:nameLabel];
    nameLabel.sd_layout
    .leftSpaceToView(view, 15)
    .widthIs(65)
    .topSpaceToView(label, 15)
    .autoHeightRatio(0);
    
    UILabel *urlLabel = UILabel.alloc.init;
    urlLabel.font = fontsize_14();
    urlLabel.textColor = UIColor.Text_Theme;
    [view addSubview:urlLabel];
    urlLabel.sd_layout
    .leftSpaceToView(nameLabel, 15)
    .rightSpaceToView(view, 15)
    .topSpaceToView(label, 15)
    .autoHeightRatio(0);
    
    for (NSDictionary *obj in [ZYDetaileProcessing DPArchiveInfoWithKey:@"getMainAddress"]) {
        ZYIPManagerModel *model = [ZYIPManagerModel.alloc initWithDictionary:obj];
        if (model.select == 1) {
            nameLabel.text = model.name;
            [nameLabel updateLayout];
            
            urlLabel.text = model.url;
            [urlLabel updateLayout];
            
            break;
        }
    }
    
    UIView *lineView = UIView.alloc.init;
    lineView.backgroundColor = UIColor.Background_Color;
    [view addSubview:lineView];
    lineView.sd_layout
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .topSpaceToView(urlLabel, 15)
    .heightIs(10);
       
    UILabel *label1 = UILabel.alloc.init;
    label1.font = fontsize_14();
    label1.textColor = UIColor.Text_Black;
    label1.text = @"添加IP地址";
    [view addSubview:label1];
    label1.sd_layout
    .leftSpaceToView(view, 15)
    .rightSpaceToView(view, 15)
    .topSpaceToView(lineView, 15)
    .autoHeightRatio(0);
       
    _nameTextField = UITextField.alloc.init;
    _nameTextField.placeholder = @"备注：例如 正式环境";
    _nameTextField.textColor = UIColor.Text_Black;
    _nameTextField.font = fontsize_14();
    _nameTextField.placeholderFont = fontsize_14();
    _nameTextField.placeholderColor = UIColor.Text_Gray;
    _nameTextField.delegate = self;
    [view addSubview:_nameTextField];
    _nameTextField.sd_layout
    .leftSpaceToView(view, 15)
    .rightSpaceToView(view, 15)
    .topSpaceToView(label1, 15)
    .heightIs(32.5);
       
    _urlTextField = UITextField.alloc.init;
    _urlTextField.placeholder = @"输入IP地址信息";
    _urlTextField.textColor = UIColor.Text_Black;
    _urlTextField.font = fontsize_14();
    _urlTextField.placeholderFont = fontsize_14();
    _urlTextField.placeholderColor = UIColor.Text_Gray;
    _urlTextField.delegate = self;
    [view addSubview:_urlTextField];
    _urlTextField.sd_layout
    .leftSpaceToView(view, 15)
    .rightSpaceToView(view, 15)
    .topSpaceToView(_nameTextField, 7.5)
    .heightIs(32.5);
       
    weak_self
    UIButton *btn2 = UIButton.alloc.init;
    [btn2 setTitle:@"添加" forState:0];
    [btn2 setTitleColor:UIColor.whiteColor forState:0];
    btn2.layer.cornerRadius = 5;
    btn2.titleLabel.font = fontsize_14();
    btn2.backgroundColor = UIColor.Text_Theme;
    [view addSubview:btn2];
    btn2.block = ^(UIButton * _Nonnull btn) {
        [weakSelf addIP];
    };
    btn2.sd_layout
    .centerXEqualToView(view)
    .topSpaceToView(_urlTextField, 15)
    .widthIs(SCREEN_WITDH() / 2.5)
    .heightIs(35);
    
    UIView *lineView1 = UIView.alloc.init;
    lineView1.backgroundColor = UIColor.Background_Color;
    [view addSubview:lineView1];
    lineView1.sd_layout
    .leftSpaceToView(view, 0)
    .rightSpaceToView(view, 0)
    .topSpaceToView(btn2, 15)
    .heightIs(10);
    
    return view;
}

- (void)addIP
{
    if (_nameTextField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入备注名"];
        return;
    }
    
    if (_urlTextField.text.length == 0) {
        [SVProgressHUD showInfoWithStatus:@"请输入IP地址"];
        return;
    }
    
    ZYIPManagerModel *model = ZYIPManagerModel.alloc.init;
    model.name = _nameTextField.text;
    model.url = _urlTextField.text;
    model.select = 0;
    
    NSMutableArray *infoArray = NSMutableArray.alloc.init;
     [infoArray addObject:model];
     for (ZYIPManagerModel *infoModel in _tableArray) {
         [infoArray addObject:infoModel];
     }
     [_tableArray removeAllObjects];
     [_tableArray addObjectsFromArray:infoArray];
    
    [self resetIPSaveInfo];
    
    [_tableView reloadData];
    _nameTextField.text = nil;
    _urlTextField.text = nil;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    ZYIPManagerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ZYIPManagerCell"];
    if (!cell) {
        cell = [[ZYIPManagerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"ZYIPManagerCell"];
    }
    cell.model = _tableArray[indexPath.row];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (!_sheetView) {
        [UIApplication.sharedApplication.keyWindow addSubview:self.sheetView];
        _sheetView.sd_layout
        .leftSpaceToView(UIApplication.sharedApplication.keyWindow, 0)
        .rightSpaceToView(UIApplication.sharedApplication.keyWindow, 0)
        .bottomSpaceToView(UIApplication.sharedApplication.keyWindow, 0)
        .topSpaceToView(UIApplication.sharedApplication.keyWindow, 0);
    }else{
        _sheetView.hidden = NO;
    }
    
    NSMutableArray *infoArray = NSMutableArray.alloc.init;
    
    ZYFuctionModel *model1 = ZYFuctionModel.alloc.init;
    model1.typeName = @"选择当前IP";
    model1.type = toString(indexPath.row);
    [infoArray addObject:model1];
    
    ZYFuctionModel *model2 = ZYFuctionModel.alloc.init;
    model2.typeName = @"删除当前IP信息";
    model2.type = toString(indexPath.row);
    [infoArray addObject:model2];
    
    _sheetView.infoArray = infoArray;
}

- (ZYSheetView *)sheetView
{
    if (!_sheetView) {
        _sheetView = ZYSheetView.alloc.init;
        weak_self;
        _sheetView.closeT = ^(NSInteger index) {
            weakSelf.sheetView.hidden = YES;
        };
        _sheetView.clickAction = ^(ZYFuctionModel * _Nonnull clickModel) {
            weakSelf.sheetView.hidden = YES;
            
            if ([clickModel.typeName containsString:@"选择"]) {
                for (int i = 0; i < weakSelf.tableArray.count; i ++) {
                    ZYIPManagerModel *model = weakSelf.tableArray[i];
                    if (clickModel.type.integerValue == i) {
                        model.select = 1;
//                        ZYSingleton.shareSingleton.mainAddress = model.url;
                    }else{
                        model.select = 0;
                    }
                }
                [weakSelf.tableView reloadData];
                [weakSelf resetIPSaveInfo];
                // 清理缓存
//                [MMKVManager clearMemoryCache];
            }
            
            if ([clickModel.typeName containsString:@"删除"]) {
                [JXTAlertTools showAlertWith:weakSelf title:nil message:@"确定删除？删除后无法找回" callbackBlock:^(NSInteger btnIndex) {
                    if (btnIndex == 1) {
                        if (weakSelf.tableArray.count == 1) {
                            [SVProgressHUD showInfoWithStatus:@"必须保持至少1个IP地址"];
                        }else{
                            NSMutableArray *infoArray = NSMutableArray.alloc.init;
                            for (int i = 0; i < weakSelf.tableArray.count; i ++) {
                                ZYIPManagerModel *model = weakSelf.tableArray[i];
                                if (clickModel.type.integerValue == i) {
                                }else{
                                    [infoArray addObject:model];
                                }
                            }
                            
                            [weakSelf.tableArray removeAllObjects];
                            [weakSelf.tableArray addObjectsFromArray:infoArray];
                            
                            BOOL is = NO;
                            for (int i = 0; i < weakSelf.tableArray.count; i ++) {
                                ZYIPManagerModel *model = weakSelf.tableArray[i];
                                if (model.select == 1) {
                                    is = YES;
                                }
                            }
                            
                            if (!is) {
                                ZYIPManagerModel *model = weakSelf.tableArray.firstObject;
                                model.select = 1;
//                                ZYSingleton.shareSingleton.mainAddress = model.url;
                                [weakSelf.tableArray replaceObjectAtIndex:0 withObject:model];
                            }
                            [weakSelf.tableView reloadData];
                            [weakSelf resetIPSaveInfo];
                        }
                    }
                } cancelButtonTitle:@"取消" destructiveButtonTitle:@"确定" otherButtonTitles:nil, nil];
            }
        };
    }
    return _sheetView;
}

- (void)resetIPSaveInfo
{
    NSMutableArray *infoArray = NSMutableArray.alloc.init;
    for (ZYIPManagerModel *model in _tableArray) {
        [infoArray addObject:model.toDictionary];
    }
    [ZYDetaileProcessing DPSaveInfoWithValue:infoArray key:@"getMainAddress"];
}

- (void)dealloc
{
    [_sheetView removeFromSuperview];
}

@end
