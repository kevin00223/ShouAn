//
//  SALeaveRecordInfoSpecialCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALeaveRecordInfoSpecialCell.h"

@interface SALeaveRecordInfoSpecialCell ()



@end

@implementation SALeaveRecordInfoSpecialCell

- (void)initValues {
    [super initValues];
    
    self.contentLabel.numberOfLines = 2;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).offset(5);
        make.width.offset(200);
    }];
}

@end
