//
//  SAExamInfoModel.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAExamInfoModel.h"
#import "MJExtension.h"

@implementation SAExamInfoModel

+ (NSArray *)examInfoModelWithDict:(NSDictionary *)dict {
    SAExamInfoModel *model = [SAExamInfoModel mj_objectWithKeyValues:dict];
    return [NSArray arrayWithObject:model];
}

@end
