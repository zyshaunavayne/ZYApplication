//
//  ZYIPManagerCell.m
//  SGBProject
//
//  Created by zhangyu on 2020/5/12.
//  Copyright © 2020 dtx. All rights reserved.
//

#import "ZYIPManagerCell.h"

@interface ZYIPManagerCell ()
@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *urlLabel;
@property (nonatomic, strong) UIView *lineView;
@end

@implementation ZYIPManagerCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.contentView.backgroundColor = self.backgroundColor = UIColor.whiteColor;
        
        [self.contentView addSubview:self.nameLabel];
        [self.contentView addSubview:self.urlLabel];
        [self.contentView addSubview:self.lineView];
    }
    return self;
}

- (void)setModel:(ZYIPManagerModel *)model
{
    _model = model;
    
    _nameLabel.text = _model.name.checkNull;
    _nameLabel.sd_layout
    .leftSpaceToView(self.contentView, 15)
    .widthIs(62.5)
    .topSpaceToView(self.contentView, 0)
    .heightIs(44);
    
    _urlLabel.text = _model.url.checkNull;
    _urlLabel.sd_layout
    .leftSpaceToView(_nameLabel, 15)
    .rightSpaceToView(self.contentView, 15)
    .centerYEqualToView(self.contentView)
    .heightIs(44);
    
    _lineView.sd_layout
    .leftSpaceToView(self.contentView, 0)
    .rightSpaceToView(self.contentView, 0)
    .bottomSpaceToView(self.contentView, 0)
    .heightIs(margin_line());
    
    if (_model.select == 1) {
        _nameLabel.textColor = _urlLabel.textColor = UIColor.Text_Theme;
    }else{
        _nameLabel.textColor = _urlLabel.textColor = UIColor.Text_Gray;
    }
    [self setupAutoHeightWithBottomView:_nameLabel bottomMargin:0];
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        _nameLabel = UILabel.alloc.init;
        _nameLabel.font = fontsize_14();
    }
    return _nameLabel;
}

- (UILabel *)urlLabel
{
    if (!_urlLabel) {
        _urlLabel = UILabel.alloc.init;
        _urlLabel.font = fontsize_14();
        _urlLabel.numberOfLines = 0;
    }
    return _urlLabel;
}

- (UIView *)lineView
{
    if (!_lineView) {
        _lineView = UIView.alloc.init;
        _lineView.backgroundColor = UIColor.Line;
    }
    return _lineView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

}

@end
