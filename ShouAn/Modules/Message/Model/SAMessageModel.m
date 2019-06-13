//
//  SAMessageModel.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAMessageModel.h"
#import "MJExtension.h"

@implementation SAMessageModel

+ (NSArray *)messageModelWithPlistName:(NSString *)plistName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    NSArray *dictArrs = [NSArray arrayWithContentsOfFile:filePath];
    
    return [SAMessageModel mj_objectArrayWithKeyValuesArray:dictArrs];
}

@end
