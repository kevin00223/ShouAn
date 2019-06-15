//
//  SALeaveRecordModel.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SALeaveRecordModel.h"
#import "MJExtension.h"

@implementation SALeaveRecordModel

+ (NSArray *)leaveRecordModelWithDict:(NSDictionary *)dict {
    SALeaveRecordModel *model = [SALeaveRecordModel mj_objectWithKeyValues:dict];
    return [NSArray arrayWithObject:model];
}

@end
