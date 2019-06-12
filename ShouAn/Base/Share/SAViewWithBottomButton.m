//
//  SAViewWithBottomButton.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAViewWithBottomButton.h"

@interface SAViewWithBottomButton ()

@property (nonatomic, strong) UIButton *confirmButton;

@end

@implementation SAViewWithBottomButton

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    [self addSubview:self.tableView];
    [self addSubview:self.confirmButton];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self);
        make.bottom.equalTo(self).offset(-80);
    }];
    
    [self.confirmButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.offset(45);
        make.bottom.equalTo(self).offset(-30);
    }];
}

- (void)setDataSource:(NSArray *)dataSource {
    _dataSource = dataSource;
}

#pragma mark - private method

- (void)confirmButtonClicked: (UIButton *)confirmButton {
    self.confirmButtonClickedBlock();
}

- (void)panGesture: (UIGestureRecognizer *)panGesture {
    [self.tableView endEditing:YES];
}

#pragma mark - lazy loading

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.scrollEnabled = NO;
        _tableView.tableFooterView = [UIView new];
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
//        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(panGesture:)];
        [_tableView addGestureRecognizer:pan];
    }
    return _tableView;
}

- (UIButton *)confirmButton {
    if (!_confirmButton) {
        _confirmButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _confirmButton.layer.cornerRadius = 22.0;
        _confirmButton.layer.masksToBounds = YES;
        [_confirmButton setTitle:@"确认" forState:UIControlStateNormal];
        [_confirmButton setBackgroundColor:SAGreenColor];
        [_confirmButton addTarget:self action:@selector(confirmButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _confirmButton;
}

@end
