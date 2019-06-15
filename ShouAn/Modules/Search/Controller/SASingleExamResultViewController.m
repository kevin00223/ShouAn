//
//  SASingleExamResultViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASingleExamResultViewController.h"
#import "SASingleCourseResultCell.h"
#import "SASingleCourseResultModel.h"

static NSString *singleCourseResultCellID = @"singleCourseResultCell";

@interface SASingleExamResultViewController ()

@end

@implementation SASingleExamResultViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"成绩查询";
    [self.tableView registerClass:[SASingleCourseResultCell class] forCellReuseIdentifier:singleCourseResultCellID];
}

- (void)setCourseType:(SACourseType)courseType {
    _courseType = courseType;
    
    switch (_courseType) {
        case 0:
            self.dataSource = [SASingleCourseResultModel singleCourseResultModelWithDict:@{
                                                                                           @"courseTitle" : @"语文", @"points" : @"130", @"classRank" : @"第3名", @"gradeRank" : @"第6名"
                                                                                           }];
            break;
        case 1:
            self.dataSource = [SASingleCourseResultModel singleCourseResultModelWithDict:@{
                                                                                           @"courseTitle" : @"数学", @"points" : @"125", @"classRank" : @"第5名", @"gradeRank" : @"第5名"
                                                                                           }];
            break;
        case 2:
            self.dataSource = [SASingleCourseResultModel singleCourseResultModelWithDict:@{
                                                                                           @"courseTitle" : @"英语", @"points" : @"145", @"classRank" : @"第1名", @"gradeRank" : @"第3名"
                                                                                           }];
            break;
        case 3:
            self.dataSource = [SASingleCourseResultModel singleCourseResultModelWithDict:@{
                                                                                           @"courseTitle" : @"化学", @"points" : @"70", @"classRank" : @"第10名", @"gradeRank" : @"第30名"
                                                                                           }];
            break;
        case 4:
            self.dataSource = [SASingleCourseResultModel singleCourseResultModelWithDict:@{
                                                                                           @"courseTitle" : @"物理", @"points" : @"80", @"classRank" : @"第9名", @"gradeRank" : @"第23名"
                                                                                           }];
            break;
        case 5:
            self.dataSource = [SASingleCourseResultModel singleCourseResultModelWithDict:@{
                                                                                           @"courseTitle" : @"生物", @"points" : @"85", @"classRank" : @"第10名", @"gradeRank" : @"第22名"
                                                                                           }];
            break;
        case 6:
            self.dataSource = [SASingleCourseResultModel singleCourseResultModelWithDict:@{
                                                                                           @"courseTitle" : @"综合", @"points" : @"240", @"classRank" : @"第5名", @"gradeRank" : @"第10名"
                                                                                           }];
            break;
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SASingleCourseResultCell *singleCourseResultCell = [tableView dequeueReusableCellWithIdentifier:singleCourseResultCellID forIndexPath:indexPath];
    singleCourseResultCell.reslutModel = self.dataSource[indexPath.row];
    singleCourseResultCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return singleCourseResultCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 260;
}

@end
