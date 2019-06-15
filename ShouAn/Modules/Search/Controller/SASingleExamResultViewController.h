//
//  SASingleExamResultViewController.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SABaseNoticeViewController.h"

typedef enum : NSInteger {
    SACourseTypeChinese = 0,
    SACourseTypeMath = 1,
    SACourseTypeEnglish = 2,
    SACourseTypeChemistry = 3,
    SACourseTypePhysics = 4,
    SACourseTypeBiology = 5,
    SACourseTypeUniversal = 6,
} SACourseType;

NS_ASSUME_NONNULL_BEGIN

@interface SASingleExamResultViewController : SABaseNoticeViewController

@property (nonatomic, assign) SACourseType courseType;

@end

NS_ASSUME_NONNULL_END
