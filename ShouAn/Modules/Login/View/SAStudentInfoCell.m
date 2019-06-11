//
//  SAStudentInfoCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAStudentInfoCell.h"

@interface SAStudentInfoCell ()

@property (nonatomic, strong) UITextField *infoTextField;

@property (nonatomic, strong) UIView *sepratorLine;

@end

@implementation SAStudentInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.infoTextField];
    [self.contentView addSubview:self.sepratorLine];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(15);
        make.width.offset(100);
    }];
    
    [self.infoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.titleLabel.mas_right).offset(15);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.offset(30);
    }];
    
    [self.sepratorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.contentView);
        make.height.offset(1/[UIScreen mainScreen].scale);
    }];
}

#pragma mark - lazy loading

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = SAHexColor(0x646464);
    }
    return _titleLabel;
}

- (UITextField *)infoTextField {
    if (!_infoTextField) {
        _infoTextField = [[UITextField alloc]init];
        _infoTextField.backgroundColor = [UIColor cyanColor];
    }
    return _infoTextField;
}

- (UIView *)sepratorLine {
    if (!_sepratorLine) {
        _sepratorLine = [[UIView alloc]init];
        _sepratorLine.backgroundColor = SAHexColor(0xDCDCDC);
    }
    return _sepratorLine;
}

@end
