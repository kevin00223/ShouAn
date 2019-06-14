//
//  SABaseNoticeViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/13.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SABaseNoticeViewController.h"

@interface SABaseNoticeViewController () <UITableViewDelegate, UITableViewDataSource>

@end

@implementation SABaseNoticeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
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

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
    
    [self.tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
//    return 4;
}

#pragma mark - lazy loading

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.tableFooterView = [UIView new];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;
}

@end
