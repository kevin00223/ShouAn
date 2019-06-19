//
//  SACurriculumNumberCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/20.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SACurriculumNumberCell.h"

@interface SACurriculumNumberCell ()

@property (nonatomic, strong) UIImageView *numberView;

@end

@implementation SACurriculumNumberCell

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self.contentView addSubview:self.numberView];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self.numberView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
}

- (void)setImageName:(NSString *)imageName {
    _imageName = imageName;
    
    self.numberView.image = [UIImage imageNamed:_imageName];
}

- (UIImageView *)numberView {
    if (!_numberView) {
        _numberView = [[UIImageView alloc]init];
    }
    return _numberView;
}

@end
