//
//  SABaseNoticeViewController.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SABaseViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface SABaseNoticeViewController : SABaseViewController

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSource;

@end

NS_ASSUME_NONNULL_END
