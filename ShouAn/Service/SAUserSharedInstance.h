//
//  SAUserSharedInstance.h
//  ShouAn
//
//  Created by 李凯 on 2019/6/20.
//  Copyright © 2019 LK. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SAUserSharedInstance : NSObject <NSCopying, NSMutableCopying>

//_studentInfoArray = @[@"学生姓名:", @"学生学号:", @"学生性别:", @"学生班级:", @"您的姓名:", @"您的电话:", @"与学生关系:", @"第二联系人:", @"与学生关系:", @"第二联系电话:"];

@property (nonatomic, strong) NSString *studentNo;
@property (nonatomic, strong) NSString *password;

//@property (nonatomic, strong) NSString *studentName;
//@property (nonatomic, strong) NSString *studentGender;
//@property (nonatomic, strong) NSString *studentGrade;
//@property (nonatomic, strong) NSString *parentName;
//@property (nonatomic, strong) NSString *parentPhone;
//@property (nonatomic, strong) NSString *relationship;
//@property (nonatomic, strong) NSString *secondContactPerson;
//@property (nonatomic, strong) NSString *secondContactPersonPhone;

+ (instancetype)sharedInstance;

@end

NS_ASSUME_NONNULL_END
