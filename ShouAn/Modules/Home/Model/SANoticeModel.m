//
//  SANoticeModel.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/14.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SANoticeModel.h"
#import "MJExtension.h"

@implementation SANoticeModel

+ (NSArray *)noticeModelWithPlistName:(NSString *)plistName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    NSArray *dictArrs = [NSArray arrayWithContentsOfFile:filePath];
    
    return [SANoticeModel mj_objectArrayWithKeyValuesArray:dictArrs];
}

@end
