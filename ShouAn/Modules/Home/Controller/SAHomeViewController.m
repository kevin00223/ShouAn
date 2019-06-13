//
//  SAHomeViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAHomeViewController.h"
#import "UIButton+SACustomButton.h"
//#import "SANoticeViewController.h"

#define kTopViewHeight 262
#define kMargin 10
#define kColCount 2
#define kGridViewHeight (kScreenHeight-kTabBarHeight-kMargin-kTopViewHeight)

typedef enum {
    SAHomeGridTypeNotice = 0,
    SAHomeGridTypeHomework = 1,
    SAHomeGridTypeDayoff = 2,
    SAHomeGridTypeCurriculum = 3,
    SAHomeGridTypeContactList = 4,
    SAHomeGridTypeLeaveRecord = 5,
} SAHomeGridType;

@interface SAHomeViewController ()

@property (nonatomic, strong) UIImageView *banner;
@property (nonatomic, strong) UIView *infoContainerView;
@property (nonatomic, strong) UIImageView *icon;
@property (nonatomic, strong) UILabel *infoLabel;

@property (nonatomic, copy) NSArray *gridButtonInfo;

@end

@implementation SAHomeViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:YES animated:animated];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:animated];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self createTopView];
    [self createGridView];
}

- (void)createTopView {
    [self.view addSubview:self.banner];
    [self.banner addSubview:self.infoContainerView];
    [self.banner addSubview:self.icon];
    [self.banner addSubview:self.infoLabel];
}

- (void)createGridView {
    for (int i = 0; i < 6; i ++) {
        UIView *singleGridView = [[UIView alloc]init];
        singleGridView.layer.borderWidth = 1.0;
        singleGridView.layer.borderColor = SAHexColor(0xF0F0F0).CGColor;
        [self.view addSubview:singleGridView];
        
        NSInteger row = i / kColCount;
        NSInteger col = i % kColCount;
        NSInteger singleGridViewWidth = kScreenWidth / 2;
        NSInteger singleGridViewHeight = kGridViewHeight / 3;
        
        CGFloat singleGridViewX = singleGridViewWidth * col;
        CGFloat singleGridViewY = (kTopViewHeight+kMargin) + singleGridViewHeight * row;
        singleGridView.frame = CGRectMake(singleGridViewX, singleGridViewY, singleGridViewWidth, singleGridViewHeight);
        
        
        UIButton *gridButton = [UIButton buttonWithType:UIButtonTypeCustom];
        // 取消按钮点击变灰的效果
        [gridButton setAdjustsImageWhenHighlighted:NO];
        [singleGridView addSubview:gridButton];
        [gridButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.offset(100);
            make.width.offset(90);
            make.center.equalTo(singleGridView);
        }];
        [gridButton setImage:[UIImage imageNamed:self.gridButtonInfo[i][@"imageName"]] forState:UIControlStateNormal];
        [gridButton setTitle:self.gridButtonInfo[i][@"title"] forState:UIControlStateNormal];
        [gridButton setTitleColor:SAHexColor(0x303131) forState:UIControlStateNormal];
        gridButton.titleLabel.font = [UIFont systemFontOfSize:15];
        [gridButton verticalImageAndTitle:5];
        gridButton.tag = i;
        
        [gridButton addTarget:self action:@selector(gridButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    }
}

- (void)gridButtonClicked: (UIButton *)gridButton {
    switch (gridButton.tag) {
        case SAHomeGridTypeNotice:
//            [self.navigationController pushViewController:[SANoticeViewController new] animated:YES];
            break;
        case SAHomeGridTypeHomework:
            NSLog(@"homework");
            break;
        case SAHomeGridTypeDayoff:
            NSLog(@"dayoff");
            break;
        case SAHomeGridTypeCurriculum:
            NSLog(@"curr");
            break;
        case SAHomeGridTypeContactList:
            NSLog(@"contact");
            break;
        case SAHomeGridTypeLeaveRecord:
            NSLog(@"leave");
            break;
        default:
            break;
    }
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
    [self.banner mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.equalTo(self.view);
        make.height.offset(kTopViewHeight);
    }];
    
    [self.infoContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(self.banner);
        make.height.offset(52);
    }];
    
    [self.icon mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.equalTo(self.banner);
        make.width.height.offset(85);
    }];
    
    [self.infoLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.icon.mas_right).offset(10);
        make.right.equalTo(self.banner).offset(-57);
        make.bottom.equalTo(self.banner).offset(2);
        make.height.offset(35);
    }];
}

#pragma mark - lazy loading

- (UIImageView *)banner {
    if (!_banner) {
        _banner = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"banner"]];
    }
    return _banner;
}

- (UIView *)infoContainerView {
    if (!_infoContainerView) {
        _infoContainerView = [[UIView alloc]init];
        _infoContainerView.backgroundColor = [UIColor whiteColor];
    }
    return _infoContainerView;
}

- (UIImageView *)icon {
    if (!_icon) {
        _icon = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"icon"]];
    }
    return _icon;
}

- (UILabel *)infoLabel {
    if (!_infoLabel) {
        _infoLabel = [[UILabel alloc]init];
        _infoLabel.backgroundColor = SAGreenColor;
        _infoLabel.textAlignment = NSTextAlignmentCenter;
        _infoLabel.text = @"初中三年级一班";
        _infoLabel.textColor = [UIColor whiteColor];
        _infoLabel.layer.cornerRadius = 18.0;
        _infoLabel.layer.masksToBounds = YES;
    }
    return _infoLabel;
}

- (NSArray *)gridButtonInfo {
    if (!_gridButtonInfo) {
        _gridButtonInfo = @[@{@"imageName" : @"notice", @"title" : @"公示公告"},
                            @{@"imageName" : @"homework", @"title" : @"家庭作业"},
                            @{@"imageName" : @"dayOff", @"title" : @"学生请假"},
                            @{@"imageName" : @"curriculum", @"title" : @"课程表"},
                            @{@"imageName" : @"contactList", @"title" : @"通讯录"},
                            @{@"imageName" : @"leaveRecord", @"title" : @"请假记录"}
                            ];
    }
    return _gridButtonInfo;
}

@end
