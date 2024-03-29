//
//  SAScoreSearchCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/14.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAScoreSearchCell.h"
#import "SARoundCornerShadowView.h"

@interface SAScoreSearchCell ()

@end

@implementation SAScoreSearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.courseView];
}

- (void)layoutSubviews {
    [super layoutSubviews];

    [self.courseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.contentView);
    }];
}

- (UIImageView *)courseView {
    if (!_courseView) {
        _courseView = [[UIImageView alloc]init];
    }
    return _courseView;
}

@end
