//
//  SAMessageCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAMessageCell.h"
#import "SARoundCornerShadowView.h"

@interface SAMessageCell ()

@property (nonatomic, strong) SARoundCornerShadowView *shadowView;

@property (nonatomic, strong) UIImageView *iconView;

@property (nonatomic, strong) UITextView *infoView;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, assign) CGSize contentLabelSize;

@end

@implementation SAMessageCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.shadowView];
    [self.shadowView addSubview:self.iconView];
    [self.shadowView addSubview:self.infoView];
    [self.shadowView addSubview:self.timeLabel];
}

- (void)layoutSubviews {
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(self.contentView).offset(5);
        make.right.bottom.equalTo(self.contentView).offset(-5);
    }];
    
    [self.iconView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.shadowView).offset(5);
        make.top.equalTo(self.shadowView).offset(10);
        make.height.width.offset(45);
    }];
    
    [self.infoView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconView.mas_right).offset(10);
        make.right.equalTo(self.shadowView).offset(-10);
        make.top.equalTo(self.iconView);
        make.bottom.equalTo(self.shadowView).offset(-40);
    }];
    
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.infoView);
        make.bottom.equalTo(self.shadowView).offset(-10);
    }];
}

- (void)setMessageModel:(SAMessageModel *)messageModel {
    _messageModel = messageModel;
    
    self.infoView.text = messageModel.content;
    self.timeLabel.text = messageModel.time;
    self.iconView.image = [UIImage imageNamed:messageModel.image];
}

#pragma mark - lazy loading

- (SARoundCornerShadowView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[SARoundCornerShadowView alloc]initWithFrame:CGRectZero];
        _shadowView.shadowColor = SAGreenColor;
        _shadowView.shadowRadius = 8.0;
        _shadowView.shadowOpacity = 0.3;
        _shadowView.shadowOffset = CGSizeMake(5, 5);
        _shadowView.cornerRadius = 8.0;
    }
    return _shadowView;
}

- (UIImageView *)iconView {
    if (!_iconView) {
        _iconView = [[UIImageView alloc]init];
    }
    return _iconView;
}

- (UITextView *)infoView {
    if (!_infoView) {
        _infoView = [[UITextView alloc]init];
        _infoView.editable = NO;
        _infoView.font = [UIFont systemFontOfSize:15];
    }
    return _infoView;
}

- (UILabel *)timeLabel {
    if (!_timeLabel) {
        _timeLabel = [[UILabel alloc]init];
        _timeLabel.font = [UIFont systemFontOfSize:12];
        _timeLabel.textColor = SAHexColor(0x646464);
    }
    return _timeLabel;
}

@end
