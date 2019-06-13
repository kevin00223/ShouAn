//
//  SAMessageCell.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAMessageModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SAMessageCell : UITableViewCell

@property (nonatomic, strong) SAMessageModel *messageModel;

@end

NS_ASSUME_NONNULL_END
