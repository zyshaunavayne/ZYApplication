//
//  UITextField+Runtime.m
//  ZYApplication
//
//  Created by 张宇 on 2021/3/16.
//  Copyright © 2021 zhangyu. All rights reserved.
//

#import "UITextField+Runtime.h"
#import <objc/runtime.h>
#import <SDAutoLayout/SDAutoLayout.h>
#import <SVProgressHUD/SVProgressHUD.h>

@implementation UITextField (Runtime)

#pragma mark -- placeholderFont
- (UIFont *)placeholderFont
{
    return objc_getAssociatedObject(self, @"placeholderFont");;
}

- (void)setPlaceholderFont:(UIFont *)placeholderFont
{
    objc_setAssociatedObject(self, @"placeholderFont", placeholderFont, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSString *placeHolder = self.placeholder;
    if (placeHolder.length == 0) {
        placeHolder = @" ";
    }
    NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:placeHolder attributes:@{NSFontAttributeName : placeholderFont}];
    self.attributedPlaceholder = placeholderString;
}

#pragma mark -- placeholderColor
- (UIColor *)placeholderColor
{
    return objc_getAssociatedObject(self, @"placeholderColor");;
}

- (void)setPlaceholderColor:(UIColor *)placeholderColor
{
    objc_setAssociatedObject(self, @"placeholderColor", placeholderColor, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    NSString *placeHolder = self.placeholder;
    if (placeHolder.length == 0) {
        placeHolder = @" ";
    }
    NSMutableAttributedString *placeholderString = [[NSMutableAttributedString alloc] initWithString:placeHolder attributes:@{NSForegroundColorAttributeName : placeholderColor}];
    self.attributedPlaceholder = placeholderString;
}

#pragma mark -- placeholderAndTextSame
- (BOOL)placeholderAndTextSame
{
    return objc_getAssociatedObject(self, @"placeholderAndTextSame");
}

- (void)setPlaceholderAndTextSame:(BOOL)placeholderAndTextSame
{
    objc_setAssociatedObject(self, @"placeholderAndTextSame", @(placeholderAndTextSame), OBJC_ASSOCIATION_RETAIN);
    if (placeholderAndTextSame) {
        self.placeholderColor = self.textColor;
        self.placeholderFont = self.font;
    }
}

#pragma mark -- 文本字数限制
- (NSInteger)textCount
{
    return [objc_getAssociatedObject(self, @"textCount") integerValue];
}

- (void)setTextCount:(NSInteger)textCount
{
    objc_setAssociatedObject(self, @"textCount", @(textCount), OBJC_ASSOCIATION_ASSIGN);
    [self addTarget:self.superview action:@selector(editingOnlyTextCountLimit) forControlEvents:UIControlEventEditingChanged];
}

- (void)editingOnlyTextCountLimit
{
    if (self.textCount != 0) {
        if (self.text.length > self.textCount) {
            [SVProgressHUD showInfoWithStatus:[NSString stringWithFormat:@"字数限制%ld字",self.textCount]];
            self.text = [self.text substringWithRange:NSMakeRange(0, self.textCount)];
        }
    }
}

#pragma mark -- 只允许输入汉字
- (void)onlyChineseCharactersAllowed
{
    [self addTarget:self.superview action:@selector(editingOnlyChineseCharactersAllowed) forControlEvents:UIControlEventEditingChanged];
}

- (void)editingOnlyChineseCharactersAllowed
{
    UITextRange *selectedRange = self.markedTextRange;
    UITextPosition *position = [self positionFromPosition:selectedRange.start offset:0];
    if (!position) {
        NSMutableArray *textArray = [NSMutableArray array];
        for (int i = 0; i < self.text.length; i ++) {
            int a = [self.text characterAtIndex:i];
            if (a < 0x9fff && a > 0x4e00) {
                [textArray addObject:[self.text substringWithRange:NSMakeRange(i, 1)]];
            }
        }
        self.text = [textArray componentsJoinedByString:@""];
      }else {}
}

#pragma mark -- 设置边角
- (void)addLayerWithLeft:(CGFloat)left right:(CGFloat)right top:(CGFloat)top bottom:(CGFloat)bottom borderColor:(UIColor *)borderColor borderWidth:(CGFloat)borderWidth cornerRadius:(CGFloat)cornerRadius
{
    UIView *view = UIView.alloc.init;
    view.layer.cornerRadius = cornerRadius;
    view.layer.borderColor = borderColor.CGColor;
    view.layer.borderWidth = borderWidth;
    view.userInteractionEnabled = NO;
    [self addSubview:view];
    view.sd_layout
    .leftSpaceToView(self, left)
    .rightSpaceToView(self, right)
    .topSpaceToView(self, top)
    .bottomSpaceToView(self, bottom);
}

@end
