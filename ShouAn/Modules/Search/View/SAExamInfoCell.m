//
//  SAExamInfoCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAExamInfoCell.h"
#import "SARoundCornerShadowView.h"

@interface SAExamInfoCell ()

@property (nonatomic, strong) SARoundCornerShadowView *shadowView;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *examTimeLabel;
@property (nonatomic, strong) UILabel *examTime;

@property (nonatomic, strong) UILabel *examArragementLabel;
@property (nonatomic, strong) UILabel *examArragement;

@end

@implementation SAExamInfoCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.shadowView];
    [self.shadowView addSubview:self.titleLabel];
    [self.shadowView addSubview:self.examTimeLabel];
    [self.shadowView addSubview:self.examTime];
    [self.shadowView addSubview:self.examArragementLabel];
    [self.shadowView addSubview:self.examArragement];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shadowView).offset(20);
        make.centerX.equalTo(self.shadowView);
    }];
    
    [self.examTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(10);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(25);
    }];
    
    [self.examTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.examTimeLabel.mas_right).offset(10);
        make.centerY.equalTo(self.examTimeLabel);
    }];
    
    [self.examArragementLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(10);
        make.top.equalTo(self.self.examTimeLabel.mas_bottom).offset(20);
    }];
    
    [self.examArragement mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.examArragementLabel.mas_right).offset(10);
        make.top.equalTo(self.examArragementLabel);
        make.right.equalTo(self.shadowView).offset(-20);//???
    }];
}

- (void)setInfoModel:(SAExamInfoModel *)infoModel {
    _infoModel = infoModel;
    
    self.titleLabel.text = _infoModel.examTitle;
    self.examTime.text = _infoModel.examTime;
    self.examArragement.text = _infoModel.examArrangement;
}

- (SARoundCornerShadowView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[SARoundCornerShadowView alloc]initWithFrame:CGRectZero];
        _shadowView.shadowColor = [UIColor lightGrayColor];
        _shadowView.shadowRadius = 8.0;
        _shadowView.shadowOpacity = 0.3;
        _shadowView.shadowOffset = CGSizeMake(5, 5);
        _shadowView.cornerRadius = 8.0;
    }
    return _shadowView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textColor = SAGreenColor;
        _titleLabel.font = [UIFont systemFontOfSize:20];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)examTimeLabel {
    if (!_examTimeLabel) {
        _examTimeLabel = [[UILabel alloc]init];
        [_examTimeLabel sizeToFit];
        _examTimeLabel.font = [UIFont systemFontOfSize:14];
        _examTimeLabel.text = @"考试时间: ";
    }
    return _examTimeLabel;
}

- (UILabel *)examTime {
    if (!_examTime) {
        _examTime = [[UILabel alloc]init];
        _examTime.font = [UIFont systemFontOfSize:14];
        [_examTime sizeToFit];
    }
    return _examTime;
}

- (UILabel *)examArragementLabel {
    if (!_examArragementLabel) {
        _examArragementLabel = [[UILabel alloc]init];
        _examArragementLabel.font = [UIFont systemFontOfSize:14];
        [_examArragementLabel sizeToFit];
        _examArragementLabel.text = @"考试安排: ";
    }
    return _examArragementLabel;
}

- (UILabel *)examArragement {
    if (!_examArragement) {
        _examArragement = [[UILabel alloc]init];
        _examArragement.font = [UIFont systemFontOfSize:14];
        _examArragement.numberOfLines = 2;
        [_examArragement sizeToFit];
    }
    return _examArragement;
}

@end
