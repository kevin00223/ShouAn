//
//  SAMineViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAMineViewController.h"
#import "SAChangePwdViewController.h"
#import "SAAboutUsViewController.h"
#import "SASettingViewController.h"
#import "SABaseCell.h"
#import "SARoundCornerShadowView.h"

static NSString *mineCellID = @"mineCell";

@interface SAMineViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIView *topContainerView;
@property (nonatomic, strong) UIView *topGreenView;
@property (nonatomic, strong) SARoundCornerShadowView *shadowView;
@property (nonatomic, strong) UIImageView *topIcon;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *subTitleLabel;

@property (nonatomic, copy) NSArray *dataSource;

@end

@implementation SAMineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initSubviews];
}

- (void)initSubviews {
    
    [self.view addSubview:self.tableView];
    [self.topContainerView addSubview:self.topGreenView];
    [self.topContainerView addSubview:self.shadowView];
    [self.topContainerView addSubview:self.topIcon];
    [self.shadowView addSubview:self.titleLabel];
    [self.shadowView addSubview:self.subTitleLabel];
    
    self.tableView.tableHeaderView = self.topContainerView;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
    
    [self.topGreenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.topContainerView);
        make.height.offset(170);
    }];
    
    [self.shadowView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.top.equalTo(self.view).offset(75);
        make.right.equalTo(self.view).offset(-10);
        make.height.offset(130);
    }];

    [self.topIcon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.topContainerView);
        make.top.equalTo(self.topContainerView).offset(30);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.shadowView).offset(60);
        make.centerX.equalTo(self.shadowView);
    }];
    
    [self.subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_bottom).offset(10);
        make.centerX.equalTo(self.shadowView);
    }];
}

#pragma mark - tableview datasource / delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SABaseCell *cell = [tableView dequeueReusableCellWithIdentifier:mineCellID forIndexPath:indexPath];
    cell.titleLabel.text = self.dataSource[indexPath.row];
    cell.titleLabel.textColor = SAHexColor(0x323232);
    cell.titleLabel.font = [UIFont systemFontOfSize:15];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    switch (indexPath.row) {
        case 0:
            NSLog(@"信息");
            break;
        case 1:
            [self.navigationController pushViewController:[SAChangePwdViewController new] animated:YES];
            break;
        case 2:
            [self.navigationController pushViewController:[SAAboutUsViewController new] animated:YES];
            break;
        case 3:
            [self.navigationController pushViewController:[SASettingViewController new] animated:YES];
            break;
        default:
            break;
    }
}

#pragma mark - lazy loading

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        [_tableView registerClass:[SABaseCell class] forCellReuseIdentifier:mineCellID];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.scrollEnabled = NO;
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [UIView new];
    }
    return _tableView;
}

- (UIView *)topContainerView {
    if (!_topContainerView) {
        _topContainerView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 230)];
        _topContainerView.backgroundColor = [UIColor whiteColor];
    }
    return _topContainerView;
}

- (UIView *)topGreenView {
    if (!_topGreenView) {
        _topGreenView = [[UIView alloc]init];
        _topGreenView.backgroundColor = SAGreenColor;
    }
    return _topGreenView;
}

- (SARoundCornerShadowView *)shadowView {
    if (!_shadowView) {
        _shadowView = [[SARoundCornerShadowView alloc]initWithFrame:CGRectZero];
        _shadowView.shadowColor = [UIColor lightGrayColor];
        _shadowView.shadowRadius = 8.0;
        _shadowView.shadowOpacity = 0.3;
        _shadowView.shadowOffset = CGSizeMake(5, 5);
        _shadowView.cornerRadius = 8.0;
    }
    return _shadowView;
}

- (UIImageView *)topIcon {
    if (!_topIcon) {
        _topIcon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    }
    return _topIcon;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.text = @"王月月-妈妈";
        _titleLabel.textColor = SAHexColor(0x323232);
        [_titleLabel sizeToFit];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:18];
    }
    return _titleLabel;
}

- (UILabel *)subTitleLabel {
    if (!_subTitleLabel) {
        _subTitleLabel = [[UILabel alloc]init];
        _subTitleLabel.text = @"王月月  女  15010695466";
        _subTitleLabel.textColor = SAHexColor(0x646464);
        [_subTitleLabel sizeToFit];
        _subTitleLabel.textAlignment = NSTextAlignmentCenter;
        _subTitleLabel.font = [UIFont systemFontOfSize:14];
    }
    return _subTitleLabel;
}

- (NSArray *)dataSource {
    if (!_dataSource) {
        _dataSource = @[@"学生信息", @"修改密码", @"关于我们", @"设置"];
    }
    return _dataSource;
}

@end
