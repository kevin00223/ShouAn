//
//  SATextFieldCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SATextFieldCell.h"

@interface SATextFieldCell ()

@property (nonatomic, strong) UITextField *infoTextField;

@end

@implementation SATextFieldCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [super initSubviews];
    [self.contentView addSubview:self.infoTextField];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.infoTextField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.contentView);
        make.left.equalTo(self.contentView).offset(115);
        make.right.equalTo(self.contentView).offset(-15);
        make.height.offset(30);
    }];
}

#pragma mark - lazy loading

- (UITextField *)infoTextField {
    if (!_infoTextField) {
        _infoTextField = [[UITextField alloc]init];
        _infoTextField.backgroundColor = [UIColor whiteColor];
    }
    return _infoTextField;
}

@end
