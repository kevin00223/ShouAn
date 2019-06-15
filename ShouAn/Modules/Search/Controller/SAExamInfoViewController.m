//
//  SAExamInfoViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/15.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAExamInfoViewController.h"
#import "SAExamInfoCell.h"
#import "SAExamInfoModel.h"

static NSString *examInfoCellID = @"examInfoCell";

@interface SAExamInfoViewController ()

@end

@implementation SAExamInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
}

- (void)initValues {
    self.title = @"考试查询";
    [self.tableView registerClass:[SAExamInfoCell class] forCellReuseIdentifier:examInfoCellID];
}

- (void)setExamType:(SAExamType )examType {
    _examType = examType;
    
    switch (examType) {
        case SAExamTypeFirstMonthlyExam:
            self.dataSource = [SAExamInfoModel examInfoModelWithDict:@{
                                                                       @"examTitle" : @"第一次月考",
                                                                       @"examTime" : @"2019年03月12日-2019年03月13日",
                                                                       @"examArrangement" : @"03-12上午语文   下午数学/生物    03-13上午英语   下午化学/物理"
                                                                       }];
            break;
        case SAExamTypeThirdMonthlyExam:
            self.dataSource = [SAExamInfoModel examInfoModelWithDict:@{
                                                                       @"examTitle" : @"第三次月考",
                                                                       @"examTime" : @"2019年05月12日-2019年05月13日",
                                                                       @"examArrangement" : @"05-12上午语文   下午数学/生物    05-13上午英语   下午化学/物理"
                                                                       }];
            break;
        case SAExamTypeMidTermExam:
            self.dataSource = [SAExamInfoModel examInfoModelWithDict:@{
                                                                       @"examTitle" : @"期中考试",
                                                                       @"examTime" : @"2019年05月02日-2019年05月03日",
                                                                       @"examArrangement" : @"05-02上午语文   下午数学/生物    05-03上午英语   下午化学/物理"
                                                                       }];
            break;
        case SAExamTypeFinalExam:
            self.dataSource = [SAExamInfoModel examInfoModelWithDict:@{
                                                                       @"examTitle" : @"期末考试",
                                                                       @"examTime" : @"2019年07月12日-2019年07月13日",
                                                                       @"examArrangement" : @"07-12上午语文   下午数学/生物     07-13上午英语   下午化学/物理"
                                                                       }];
            break;
        default:
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SAExamInfoCell *examInfoCell = [tableView dequeueReusableCellWithIdentifier:examInfoCellID forIndexPath:indexPath];
    examInfoCell.infoModel = self.dataSource[indexPath.row];
    examInfoCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return examInfoCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}

@end
