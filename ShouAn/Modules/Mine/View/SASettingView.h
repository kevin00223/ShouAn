//
//  SASettingView.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAViewWithBottomButton.h"

NS_ASSUME_NONNULL_BEGIN

typedef void(^CellSelectedBlock)(NSIndexPath *indexPath);

@interface SASettingView : SAViewWithBottomButton

@property (nonatomic, copy) CellSelectedBlock cellSelectedBlock;

@end

NS_ASSUME_NONNULL_END
