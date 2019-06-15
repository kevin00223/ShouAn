//
//  SAExamInfoViewController.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SABaseNoticeViewController.h"

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    SAExamTypeFirstMonthlyExam,
    SAExamTypeThirdMonthlyExam,
    SAExamTypeMidTermExam,
    SAExamTypeFinalExam,
} SAExamType;

@interface SAExamInfoViewController : SABaseNoticeViewController

@property (nonatomic, assign) SAExamType examType;

@end

NS_ASSUME_NONNULL_END
