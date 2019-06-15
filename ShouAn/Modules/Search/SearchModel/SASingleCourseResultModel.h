//
//  SASingleCourseResultModel.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SASingleCourseResultModel : NSObject

@property (nonatomic, strong) NSString *courseTitle;

@property (nonatomic, strong) NSString *points;

@property (nonatomic, strong) NSString *classRank;

@property (nonatomic, strong) NSString *gradeRank;

+ (NSArray *)singleCourseResultModelWithDict: (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
