//
//  SASearchViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASearchViewController.h"
#import "SASearchCell.h"
#import "SASearchModel.h"
#import "SARoundCornerShadowView.h"

static NSString *searchCellID = @"searchCell";

@interface SASearchViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, copy) NSArray *dataSource;

@property (nonatomic, strong) UIView *headerView;

@property (nonatomic, strong) SARoundCornerShadowView *shadowView;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation SASearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"查询";
}

- (void)initSubviews {
    
    [self.view addSubview:self.tableView];
    
    [self.headerView addSubview:self.shadowView];
    [self.shadowView addSubview:self.titleLabel];
    self.tableView.tableHeaderView = self.headerView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.headerView);
        make.left.equalTo(self.headerView).offset(50);
        make.right.equalTo(self.headerView).offset(-50);
        make.height.offset(40);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.headerView);
        make.left.equalTo(self.headerView).offset(20);
        make.right.equalTo(self.headerView).offset(-20);
        make.height.offset(35);
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SASearchCell *searchCell = [tableView dequeueReusableCellWithIdentifier:searchCellID forIndexPath:indexPath];
    searchCell.searchModel = self.dataSource[indexPath.row];
    searchCell.selectionStyle = UITableViewCellSelectionStyleNone;
    return searchCell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 120;
}

#pragma mark - lazy loading

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:[UIScreen mainScreen].bounds style:UITableViewStylePlain];
        [_tableView registerClass:[SASearchCell class] forCellReuseIdentifier:searchCellID];
        _tableView.scrollEnabled = NO;
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = [SASearchModel searchModelWithPlistName:@"Search.plist"];
    }
    return _dataSource;
}

- (UIView *)headerView {
    if (!_headerView) {
        _headerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 100)];
    }
    return _headerView;
}

- (SARoundCornerShadowView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[SARoundCornerShadowView alloc]initWithFrame:CGRectZero];
        _shadowView.shadowColor = [UIColor lightGrayColor];
        _shadowView.shadowRadius = 22.0;
        _shadowView.shadowOpacity = 0.3;
        _shadowView.shadowOffset = CGSizeMake(5, 5);
        _shadowView.cornerRadius = 22.0;
    }
    return _shadowView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"初中三年级1班";
        _titleLabel.textColor = SAGreenColor;
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _titleLabel;
}

@end
