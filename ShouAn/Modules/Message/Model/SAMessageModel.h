//
//  SAMessageModel.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAMessageModel : NSObject

@property (nonatomic, strong) NSString *image;

@property (nonatomic, strong) NSString *content;

@property (nonatomic, strong) NSString *time;

+ (NSArray *)messageModelWithPlistName: (NSString *)plistName;

@end

NS_ASSUME_NONNULL_END
