//
//  SALeaveRecordModel.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SALeaveRecordModel : NSObject

@property (nonatomic, strong) NSString *month;
@property (nonatomic, strong) NSString *day;
@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *leaveType;
@property (nonatomic, strong) NSString *startTime;
@property (nonatomic, strong) NSString *endTime;

+ (NSArray *)leaveRecordModelWithDict: (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
