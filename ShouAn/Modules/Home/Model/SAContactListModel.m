//
//  SAContactListModel.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/17.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAContactListModel.h"
#import "MJExtension.h"

@implementation SAContactListModel

+ (NSArray *)contactListModelWithPlistName:(NSString *)plistName {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:plistName ofType:nil];
    NSArray *dictArrs = [NSArray arrayWithContentsOfFile:filePath];
    
    return [SAContactListModel mj_objectArrayWithKeyValuesArray:dictArrs];
}

@end
