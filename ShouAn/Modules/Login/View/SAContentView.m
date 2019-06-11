//
//  SAContentView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/11.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAContentView.h"

static NSString *const contentCellId = @"contentCell";

@interface SAContentView () <UICollectionViewDelegate,UICollectionViewDataSource>

/* 子控制器数组 */
@property(nonatomic, strong) NSArray *childVcs;
/* 父控制器 */
@property(nonatomic, weak) UIViewController *parentVC;
/* collectionView */
@property(nonatomic, strong) UICollectionView *collectionView;
/* block */
@property(nonatomic, strong) ScrollViewBlock block;

@end

@implementation SAContentView

- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs parentVC:(UIViewController *)parentVC {
    self = [super initWithFrame:frame];
    if (self) {
        _childVcs = childVcs;
        _parentVC = parentVC;
        [self setupUI];
    }
    return self;
}

- (void)setupUI {
    //1.把子控制器添加父控制器
    for (UIViewController *child in _childVcs) {
        [_parentVC addChildViewController:child];
    }
    
    [self addSubview:self.collectionView];
    [self.collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self);
    }];
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    [self endEditing:YES];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _childVcs.count;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:contentCellId forIndexPath:indexPath];
    UIViewController *childVC = _childVcs[indexPath.item];
    for (UIView *v in cell.contentView.subviews) {
        [v removeFromSuperview];
    }
    [cell.contentView addSubview:childVC.view];
    [childVC.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell.contentView);
    }];
    return cell;
}

//用手拖动结束回调
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    NSInteger offset = scrollView.contentOffset.x / self.width;
    _block(offset);
}

- (void)setOffset:(NSInteger)page
{
    [_collectionView setContentOffset:CGPointMake(page * self.width, 0) animated:YES];
}
- (void)scrollIndex:(ScrollViewBlock)block
{
    _block = block;
}

#pragma mark - lazy loading

- (UICollectionView *)collectionView {
    if (!_collectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.itemSize = CGSizeMake(kScreenWidth - 2*25, 300);
        layout.minimumLineSpacing = 0;
        layout.minimumInteritemSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.pagingEnabled = YES;
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
        [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:contentCellId];
        _collectionView.backgroundColor = [UIColor whiteColor];
    }
    return _collectionView;
}

@end
