//
//  SASingleCourseResultCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASingleCourseResultCell.h"
#import "SARoundCornerShadowView.h"

@interface SASingleCourseResultCell ()

@property (nonatomic, strong) SARoundCornerShadowView *shadowView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UILabel *courseTitleLabel;
@property (nonatomic, strong) UILabel *courseTitle;

@property (nonatomic, strong) UILabel *pointsLabel;
@property (nonatomic, strong) UILabel *points;

@property (nonatomic, strong) UILabel *classRankLabel;
@property (nonatomic, strong) UILabel *classRank;

@property (nonatomic, strong) UILabel *gradeRankLabel;
@property (nonatomic, strong) UILabel *gradeRank;

@end

@implementation SASingleCourseResultCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.shadowView];
    [self.shadowView addSubview:self.nameLabel];
    [self.shadowView addSubview:self.courseTitleLabel];
    [self.shadowView addSubview:self.courseTitle];
    [self.shadowView addSubview:self.pointsLabel];
    [self.shadowView addSubview:self.points];
    [self.shadowView addSubview:self.classRankLabel];
    [self.shadowView addSubview:self.classRank];
    [self.shadowView addSubview:self.gradeRankLabel];
    [self.shadowView addSubview:self.gradeRank];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(10);
        make.top.equalTo(self.contentView).offset(20);
        make.right.equalTo(self.contentView).offset(-10);
        make.bottom.equalTo(self.contentView).offset(-20);
    }];
    
    [self.nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shadowView).offset(10);
        make.centerX.equalTo(self.shadowView);
    }];
    
    [self.courseTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(30);
        make.top.equalTo(self.nameLabel.mas_bottom).offset(30);
    }];
    
    [self.courseTitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.courseTitleLabel.mas_right).offset(5);
        make.centerY.equalTo(self.courseTitleLabel);
    }];
    
    [self.pointsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(30);
        make.top.equalTo(self.courseTitleLabel.mas_bottom).offset(20);
    }];
    
    [self.points mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.pointsLabel.mas_right).offset(5);
        make.centerY.equalTo(self.pointsLabel);
    }];
    
    [self.classRankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(30);
        make.top.equalTo(self.pointsLabel.mas_bottom).offset(20);
    }];
    
    [self.classRank mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.classRankLabel.mas_right).offset(5);
        make.centerY.equalTo(self.classRankLabel);
    }];
    
    [self.gradeRankLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(30);
        make.top.equalTo(self.classRankLabel.mas_bottom).offset(20);
    }];
    
    [self.gradeRank mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.gradeRankLabel.mas_right).offset(5);
        make.centerY.equalTo(self.gradeRankLabel);
    }];
}

- (void)setReslutModel:(SASingleCourseResultModel *)reslutModel {
    _reslutModel = reslutModel;
    
    self.courseTitle.text = reslutModel.courseTitle;
    self.points.text = reslutModel.points;
    self.classRank.text = reslutModel.classRank;
    self.gradeRank.text = reslutModel.gradeRank;
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

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc]init];
        _nameLabel.text = @"王月月";
        _nameLabel.textColor = SAGreenColor;
        _nameLabel.font = [UIFont systemFontOfSize:20];
        [_nameLabel sizeToFit];
    }
    return _nameLabel;
}

- (UILabel *)courseTitleLabel {
    if (!_courseTitleLabel) {
        _courseTitleLabel = [[UILabel alloc]init];
        _courseTitleLabel.text = @"查询科目: ";
        _courseTitleLabel.font = [UIFont systemFontOfSize:16];
        [_courseTitle sizeToFit];
    }
    return _courseTitleLabel;
}

- (UILabel *)courseTitle {
    if (!_courseTitle) {
        _courseTitle = [[UILabel alloc]init];
        [_courseTitle sizeToFit];
    }
    return _courseTitle;
}

- (UILabel *)pointsLabel {
    if (!_pointsLabel) {
        _pointsLabel = [[UILabel alloc]init];
        _pointsLabel.text = @"分数: ";
        _pointsLabel.font = [UIFont systemFontOfSize:16];
        [_pointsLabel sizeToFit];
    }
    return _pointsLabel;
}

- (UILabel *)points {
    if (!_points) {
        _points = [[UILabel alloc]init];
        [_points sizeToFit];
    }
    return _points;
}

- (UILabel *)classRankLabel {
    if (!_classRankLabel) {
        _classRankLabel = [[UILabel alloc]init];
        _classRankLabel.text = @"班级排名: ";
        _classRankLabel.font = [UIFont systemFontOfSize:16];
        [_classRankLabel sizeToFit];
    }
    return _classRankLabel;
}

- (UILabel *)classRank {
    if (!_classRank) {
        _classRank = [[UILabel alloc]init];
        [_classRank sizeToFit];
    }
    return _classRank;
}

- (UILabel *)gradeRankLabel {
    if (!_gradeRankLabel) {
        _gradeRankLabel = [[UILabel alloc]init];
        _gradeRankLabel.text = @"年级排名: ";
        _gradeRankLabel.font = [UIFont systemFontOfSize:16];
        [_gradeRankLabel sizeToFit];
    }
    return _gradeRankLabel;
}

- (UILabel *)gradeRank {
    if (!_gradeRank) {
        _gradeRank = [[UILabel alloc]init];
        [_gradeRank sizeToFit];
    }
    return _gradeRank;
}

@end
