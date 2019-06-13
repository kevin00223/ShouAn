//
//  SAMessageCell.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAMessageCell.h"

@interface SAMessageCell ()

@property (nonatomic, strong) UIImageView *iconView;

//@property (nonatomic, strong) 

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
    
}

- (void)layoutSubviews {
    
}

@end
