//
//  SANoticeModel.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/14.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SANoticeModel : NSObject

@property (nonatomic, strong)NSString *title;
@property (nonatomic, strong)NSString *firstInfo;
@property (nonatomic, strong)NSString *secondInfo;
@property (nonatomic, strong)NSString *thirdInfo;

+ (NSArray *)noticeModelWithPlistName: (NSString *)plistName;

@end

NS_ASSUME_NONNULL_END
