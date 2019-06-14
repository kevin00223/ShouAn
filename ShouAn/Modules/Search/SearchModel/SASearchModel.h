//
//  SASearchModel.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/14.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SASearchModel : NSObject

@property (nonatomic, strong) NSString *iconImage;

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *titleColor;

@property (nonatomic, strong) NSString *intro;

+ (NSArray *)searchModelWithPlistName: (NSString *)plistName;

@end

NS_ASSUME_NONNULL_END
