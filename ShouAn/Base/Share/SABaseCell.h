//
//  SABaseCell.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SABaseCell : UITableViewCell

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UILabel *subTitleLabel;

- (void)initSubviews;

@end

NS_ASSUME_NONNULL_END
