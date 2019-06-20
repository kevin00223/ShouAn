//
//  SAViewWithBottomButton.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SAView.h"

typedef void(^ConfirmButtonClickedBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface SAViewWithBottomButton : SAView <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) ConfirmButtonClickedBlock confirmButtonClickedBlock;

@property (nonatomic, copy) NSArray *dataSource;

@property (nonatomic, strong) NSString *bottomButtonTitle;

@end

NS_ASSUME_NONNULL_END
