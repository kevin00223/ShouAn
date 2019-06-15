//
//  SALeaveRecordCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALeaveRecordCell.h"
#import "SARoundCornerShadowView.h"

@interface SALeaveRecordCell ()

@property (nonatomic, strong) SARoundCornerShadowView *shadowView;

@property (nonatomic, strong) UILabel *monthLabel;

@property (nonatomic, strong) UILabel *dayLabel;

@property (nonatomic, strong) UIView *sepratorLine;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *leaveTypeLabel;
@property (nonatomic, strong) UILabel *leaveType;

@property (nonatomic, strong) UILabel *startTimeLabel;
@property (nonatomic, strong) UILabel *startTime;

@property (nonatomic, strong) UILabel *endTimeLabel;
@property (nonatomic, strong) UILabel *endTime;

@end

@implementation SALeaveRecordCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.shadowView];
    [self.shadowView addSubview:self.monthLabel];
    [self.shadowView addSubview:self.dayLabel];
    [self.shadowView addSubview:self.sepratorLine];
    [self.shadowView addSubview:self.titleLabel];
    [self.shadowView addSubview:self.leaveTypeLabel];
    [self.shadowView addSubview:self.leaveType];
    [self.shadowView addSubview:self.startTimeLabel];
    [self.shadowView addSubview:self.startTime];
    [self.shadowView addSubview:self.endTimeLabel];
    [self.shadowView addSubview:self.endTime];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
    
    [self.monthLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(20);
        make.top.equalTo(self.shadowView).offset(40);
    }];
    
    [self.dayLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.monthLabel);
        make.top.equalTo(self.monthLabel.mas_bottom).offset(20);
    }];
    
    [self.sepratorLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.monthLabel.mas_right).offset(20);
        make.top.equalTo(self.shadowView).offset(15);
        make.bottom.equalTo(self.shadowView).offset(-15);
        make.width.offset(1/[UIScreen mainScreen].scale);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.sepratorLine.mas_right).offset(10);
        make.top.equalTo(self.shadowView).offset(20);
    }];
    
    [self.leaveTypeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(15);
    }];
    
    [self.leaveType mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.leaveTypeLabel.mas_right).offset(5);
        make.top.equalTo(self.leaveTypeLabel);
    }];
    
    [self.startTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.leaveTypeLabel.mas_bottom).offset(10);
    }];
    
    [self.startTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.startTimeLabel.mas_right).offset(5);
        make.top.equalTo(self.startTimeLabel);
    }];
    
    [self.endTimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.startTimeLabel.mas_bottom).offset(10);
    }];
    
    [self.endTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.endTimeLabel.mas_right).offset(5);
        make.top.equalTo(self.endTimeLabel);
    }];
}

- (void)setLeaveRecordModel:(SALeaveRecordModel *)leaveRecordModel {
    _leaveRecordModel = leaveRecordModel;
    
    self.monthLabel.text = [NSString stringWithFormat:@"%@月", _leaveRecordModel.month];
    self.dayLabel.text = _leaveRecordModel.day;
    self.titleLabel.text = [NSString stringWithFormat:@"%@提交的请假", _leaveRecordModel.name];
    self.leaveType.text = _leaveRecordModel.leaveType;
    self.startTime.text = _leaveRecordModel.startTime;
    self.endTime.text = _leaveRecordModel.endTime;
}

#pragma mark - lazy loading

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

- (UILabel *)monthLabel {
    if (!_monthLabel) {
        _monthLabel = [[UILabel alloc]init];
        _monthLabel.font = [UIFont systemFontOfSize:14];
        [_monthLabel sizeToFit];
    }
    return _monthLabel;
}

- (UILabel *)dayLabel {
    if (!_dayLabel) {
        _dayLabel = [[UILabel alloc]init];
        _dayLabel.font = [UIFont systemFontOfSize:20];
        [_dayLabel sizeToFit];
    }
    return _dayLabel;
}

- (UIView *)sepratorLine {
    if (!_sepratorLine) {
        _sepratorLine = [[UIView alloc]init];
        _sepratorLine.backgroundColor = SAHexColor(0xDCDCDC);
    }
    return _sepratorLine;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.font = [UIFont systemFontOfSize:15];
        [_titleLabel sizeToFit];
    }
    return _titleLabel;
}

- (UILabel *)leaveTypeLabel {
    if (!_leaveTypeLabel) {
        _leaveTypeLabel = [[UILabel alloc]init];
        _leaveTypeLabel.text = @"请假类型: ";
        _leaveTypeLabel.font = [UIFont systemFontOfSize:15];
        [_leaveTypeLabel sizeToFit];
    }
    return _leaveTypeLabel;
}

- (UILabel *)leaveType {
    if (!_leaveType) {
        _leaveType = [[UILabel alloc]init];
        _leaveType.font = [UIFont systemFontOfSize:15];
        [_leaveType sizeToFit];
    }
    return _leaveType;
}

- (UILabel *)startTimeLabel {
    if (!_startTimeLabel) {
        _startTimeLabel = [[UILabel alloc]init];
        _startTimeLabel.text = @"开始时间: ";
        _startTimeLabel.font = [UIFont systemFontOfSize:15];
        [_startTimeLabel sizeToFit];
    }
    return _startTimeLabel;
}

- (UILabel *)startTime {
    if (!_startTime) {
        _startTime = [[UILabel alloc]init];
        _startTime.font = [UIFont systemFontOfSize:15];
        [_startTime sizeToFit];
    }
    return _startTime;
}

- (UILabel *)endTimeLabel {
    if (!_endTimeLabel) {
        _endTimeLabel = [[UILabel alloc]init];
        _endTimeLabel.text = @"结束时间: ";
        _endTimeLabel.font = [UIFont systemFontOfSize:15];
        [_endTimeLabel sizeToFit];
    }
    return _endTimeLabel;
}

- (UILabel *)endTime {
    if (!_endTime) {
        _endTime = [[UILabel alloc]init];
        _endTime.font = [UIFont systemFontOfSize:15];
        [_endTime sizeToFit];
    }
    return _endTime;
}

@end
