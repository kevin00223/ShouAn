//
//  SAContactListModel.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/17.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAContactListModel : NSObject

@property (nonatomic, strong) NSString *title;

@property (nonatomic, strong) NSString *number;

+ (NSArray *)contactListModelWithPlistName: (NSString *)plistName;

@end

NS_ASSUME_NONNULL_END
