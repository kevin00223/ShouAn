//
//  SAContactListViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/17.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAContactListViewController.h"
#import "SAContactListModel.h"
#import "SAContactListCell.h"

static NSString *contactListCellID = @"contactListCell";

@interface SAContactListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) NSArray *numberArray;

@property (nonatomic, strong) NSMutableArray *selectedArr;

@end

@implementation SAContactListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"联系电话";
    _selectedArr = [[NSMutableArray alloc]init];
}

- (void)initSubviews {
    [self.view addSubview:self.tableView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)sectionButtonClicked: (UIButton *)sender {
    NSString *string = [NSString stringWithFormat:@"%ld",sender.tag - 100];
    
    if ([_selectedArr containsObject:string]) {
        [_selectedArr removeObject:string];
    }else{
        [_selectedArr addObject:string];
    }
    
    [self.tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.titleArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSString *sectionStr = [NSString stringWithFormat:@"%ld", section];
    if ([_selectedArr containsObject:sectionStr]) {
        NSArray *arr = self.numberArray[section];
        return arr.count;
    }else{
        return 0;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 40;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    
    UIView *sectionHeaderContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 40)];
    sectionHeaderContainerView.backgroundColor = [UIColor whiteColor];
    
    UILabel *sectionHeaderTitlerLabel = [[UILabel alloc]init];
    sectionHeaderTitlerLabel.text = self.titleArray[section];
    sectionHeaderTitlerLabel.textColor = SAGreenColor;
    sectionHeaderTitlerLabel.font = [UIFont systemFontOfSize:18];
    
    UIButton *sectionHeaderButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [sectionHeaderButton setImage:[UIImage imageNamed:@"sectionArrow"] forState:UIControlStateNormal];
    sectionHeaderButton.tag = section + 100;
    [sectionHeaderButton addTarget:self action:@selector(sectionButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    
    [sectionHeaderContainerView addSubview:sectionHeaderTitlerLabel];
    [sectionHeaderContainerView addSubview:sectionHeaderButton];
    
    [sectionHeaderTitlerLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sectionHeaderContainerView);
        make.left.equalTo(sectionHeaderContainerView).offset(15);
    }];
    
    [sectionHeaderButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(sectionHeaderContainerView);
        make.right.equalTo(sectionHeaderContainerView).offset(-15);
    }];
    
    return sectionHeaderContainerView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString *sectionStr = [NSString stringWithFormat:@"%ld",(long)indexPath.section];
    
    SAContactListCell *cell = [tableView dequeueReusableCellWithIdentifier:contactListCellID forIndexPath:indexPath];
    cell.selectionStyle  = UITableViewCellSelectionStyleGray;
    
    NSArray *arrayData = self.numberArray[indexPath.section];
    
    if ([_selectedArr containsObject:sectionStr]) {
        cell.model = arrayData[indexPath.row];
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 45;
}

#pragma mark - lazy loading

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        [_tableView registerClass:[SAContactListCell class] forCellReuseIdentifier:contactListCellID];
    }
    return _tableView;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"行政部门", @"班级老师电话"];
    }
    return _titleArray;
}

- (NSArray *)numberArray {
    if (!_numberArray) {
        _numberArray = [SAContactListModel contactListModelWithPlistName:@"ContactList.plist"];
    }
    return _numberArray;
}

@end
