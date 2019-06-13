//
//  SATabView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SATabView.h"

static CGFloat const indicatorH = 1;//指示器的高度

@interface SATabView ()

@property (nonatomic, strong) UIScrollView *scrollView;

@property (nonatomic, strong) NSMutableArray *titleLabels;

/* 指示器 */
@property(nonatomic,strong)UIView *indicatorView;

/* 当前的label */
@property(nonatomic,strong)UILabel *currentLbl;

/* block */
@property(nonatomic,strong)PageTapBlock block;

@end

@implementation SATabView

- (instancetype)initWithFrame:(CGRect)frame titles:(NSArray *)titles {
    self = [super initWithFrame:frame];
    if (self) {
        _titles = titles;
        [self initSubviews];
    }
    return self;
}

- (void)initSubviews {
    //1.设置scrollView
    [self addSubview:self.scrollView];
    _scrollView.frame = self.bounds;
    
    //2.设置标签的宽度
    CGFloat width = self.frame.size.width * 0.5;
    CGFloat height = self.frame.size.height - indicatorH;
    
    for (int i = 0; i < _titles.count; i++)
    {
        UILabel *lbl = [[UILabel alloc] init];
        [_scrollView addSubview:lbl];
        
        lbl.text = _titles[i];
        lbl.font = [UIFont systemFontOfSize:20];
        lbl.textColor = SAHexColor(0xC9C9C9);
        lbl.textAlignment = NSTextAlignmentCenter;
        lbl.userInteractionEnabled = YES;
        lbl.tag = i;
        [self.titleLabels addObject:lbl];
        
        if (i == 0) {
            lbl.textColor = SAGreenColor;
            _currentLbl = lbl;
        }
        
        CGFloat x = i * width;
        lbl.frame = CGRectMake(x, 0, width, height);
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
        [lbl addGestureRecognizer:tap];
    }
    
    CGFloat indicatorY = self.frame.size.height - indicatorH;
    //创建背景线
    UIView *grayLineView = [UIView new];
    [self.scrollView addSubview:grayLineView];
    grayLineView.backgroundColor = SAHexColor(0xC9C9C9);
    grayLineView.frame = CGRectMake(0, indicatorY, width * 2, indicatorH);
    
    //3.创建指示器
    [self.scrollView addSubview:self.indicatorView];
    self.indicatorView.frame = CGRectMake(0, indicatorY, width, indicatorH);
}

#pragma mark - private function
- (void)tapClick:(UITapGestureRecognizer *)sender{
    if (sender.view == _currentLbl) {
        return;
    }
    [self setSelectLable:sender.view.tag];
    if (_block) {
        _block(sender.view.tag);
    }
}

- (void)registerClick:(UIButton *)sender{
    _block(20);
}


- (void)pageClick:(PageTapBlock)block{
    _block = block;
}

- (void)setCurrentLabel:(NSInteger)index{
    [self setSelectLable:index];
}

- (void)setSelectLable:(NSInteger)index{
    UILabel *tapedLabel = _titleLabels[index];
    if (_currentLbl == tapedLabel) {
        return;
    }
    tapedLabel.textColor = SAGreenColor;
    _currentLbl.textColor = SAHexColor(0xC9C9C9);
    _currentLbl = tapedLabel;
    
    CGFloat centerX = tapedLabel.centerX;
    [UIView animateWithDuration:0.2 animations:^{
        self.indicatorView.centerX = centerX;
    }];
}

#pragma mark - lazy loading

- (UIScrollView *)scrollView {
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] init];
        _scrollView.showsVerticalScrollIndicator = NO;
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
    }
    return _scrollView;
}

- (UIView *)indicatorView {
    if (!_indicatorView) {
        _indicatorView = [[UIView alloc] init];
        _indicatorView.backgroundColor = SAGreenColor;
    }
    return _indicatorView;
}

- (NSMutableArray *)titleLabels
{
    if (!_titleLabels) {
        _titleLabels = [NSMutableArray array];
    }
    return _titleLabels;
}

@end
