//
//  SAScoreSearchViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/14.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAScoreSearchViewController.h"
#import "SAScoreSearchCell.h"
#import "SASingleExamResultViewController.h"

static NSString *scoreSearchCellID = @"scoreSearchCell";

@interface SAScoreSearchViewController ()

@end

@implementation SAScoreSearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"成绩查询";
    self.dataSource = @[@"chinese", @"math", @"english", @"chemistry", @"physics", @"biology", @"universal"];
    [self.tableView registerClass:[SAScoreSearchCell class] forCellReuseIdentifier:scoreSearchCellID];
    self.tableView.scrollEnabled = NO;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAScoreSearchCell *scoreSearchCell = [tableView dequeueReusableCellWithIdentifier:scoreSearchCellID forIndexPath:indexPath];
    scoreSearchCell.courseView.image = [UIImage imageNamed:self.dataSource[indexPath.row]];
    scoreSearchCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return scoreSearchCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    SASingleExamResultViewController *singleExamResultVC = [[SASingleExamResultViewController alloc]init];
    [self.navigationController pushViewController:singleExamResultVC animated:YES];
    singleExamResultVC.courseType = indexPath.row;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 85;
}

@end
