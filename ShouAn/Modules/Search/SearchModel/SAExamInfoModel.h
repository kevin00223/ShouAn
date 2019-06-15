//
//  SAExamInfoModel.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAExamInfoModel : NSObject

@property (nonatomic, strong) NSString *examTitle;

@property (nonatomic, strong) NSString *examTime;

@property (nonatomic, strong) NSString *examArrangement;

+ (NSArray *)examInfoModelWithDict: (NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
