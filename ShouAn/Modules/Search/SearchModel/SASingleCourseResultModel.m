//
//  SASingleCourseResultModel.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASingleCourseResultModel.h"
#import "MJExtension.h"

@implementation SASingleCourseResultModel

+ (NSArray *)singleCourseResultModelWithDict:(NSDictionary *)dict {
    SASingleCourseResultModel *model = [SASingleCourseResultModel mj_objectWithKeyValues:dict];
    return [NSArray arrayWithObject:model];
}

@end
