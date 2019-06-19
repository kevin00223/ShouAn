//
//  SACurriculumViewController.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/20.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SACurriculumViewController.h"
#import "SACurriculumTitleCell.h"
#import "SACurriculumNumberCell.h"
#import "SACurriculumCell.h"

static NSString *titleID = @"titleCellID";
static NSString *numberID = @"numberCellID";
static NSString *curriculumID = @"curriculumID";

@interface SACurriculumViewController () <UICollectionViewDataSource>

@property (nonatomic, strong) UICollectionView *titleCollectionView;
@property (nonatomic, strong) NSArray *titleArray;

@property (nonatomic, strong) UICollectionView *numberCollectionView;
@property (nonatomic, strong) NSArray *numberArray;

@property (nonatomic, strong) UICollectionView *curriculumCollectionView;
@property (nonatomic, strong) NSArray *curriculumArray;

@end

@implementation SACurriculumViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initValues];
    [self initSubviews];
}

- (void)initValues {
    self.title = @"课程表";
}

- (void)initSubviews {
    [self.view addSubview:self.titleCollectionView];
    [self.view addSubview:self.numberCollectionView];
    [self.view addSubview:self.curriculumCollectionView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (collectionView.tag == 1024) {
        return self.titleArray.count;
    }else if(collectionView.tag == 1025){
        return self.numberArray.count;
    }else{
        return self.curriculumArray.count;
    }
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell;
    if (collectionView.tag == 1024) {
        SACurriculumTitleCell *titleCell = [collectionView dequeueReusableCellWithReuseIdentifier:titleID forIndexPath:indexPath];
        titleCell.title = self.titleArray[indexPath.row];
        cell = titleCell;
    }else if(collectionView.tag == 1025){
        SACurriculumNumberCell *numberCell = [collectionView dequeueReusableCellWithReuseIdentifier:numberID forIndexPath:indexPath];
        numberCell.imageName = self.numberArray[indexPath.row];
        cell = numberCell;
    }else{
        SACurriculumCell *curriculumCell = [collectionView dequeueReusableCellWithReuseIdentifier:curriculumID forIndexPath:indexPath];
        curriculumCell.imageName = self.curriculumArray[indexPath.row];
        cell = curriculumCell;
    }
    
    return cell;
}


#pragma mark - lazy loading

- (UICollectionView *)titleCollectionView {
    if (!_titleCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(60, 44);
        layout.minimumInteritemSpacing = 5.0;
        _titleCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(35, 0, 325, 44) collectionViewLayout:layout];
        _titleCollectionView.dataSource = self;
        _titleCollectionView.backgroundColor = [UIColor whiteColor];
        [_titleCollectionView registerClass:[SACurriculumTitleCell class] forCellWithReuseIdentifier:titleID];
        _titleCollectionView.tag = 1024;
    }
    return _titleCollectionView;
}

- (NSArray *)titleArray {
    if (!_titleArray) {
        _titleArray = @[@"周一", @"周二", @"周三", @"周四", @"周五"];
    }
    return _titleArray;
}

- (UICollectionView *)numberCollectionView {
    if (!_numberCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(35, 60);
        layout.minimumInteritemSpacing = 0;
        layout.minimumLineSpacing = 0;
        _numberCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 44, 35, 540) collectionViewLayout:layout];
        _numberCollectionView.dataSource = self;
        _numberCollectionView.backgroundColor = [UIColor lightGrayColor];
        [_numberCollectionView registerClass:[SACurriculumNumberCell class] forCellWithReuseIdentifier:numberID];
        _numberCollectionView.tag = 1025;
    }
    return _numberCollectionView;
}

- (NSArray *)numberArray {
    if (!_numberArray) {
        _numberArray = @[@"number1", @"number2", @"number3", @"number4", @"number5", @"number6", @"number7", @"number8", @"number9"];
    }
    return _numberArray;
}

- (UICollectionView *)curriculumCollectionView {
    if (!_curriculumCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
        layout.itemSize = CGSizeMake(60, 57);
        layout.minimumInteritemSpacing = 3;
        layout.minimumLineSpacing = 3;
        _curriculumCollectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(38, 46, 325, 480) collectionViewLayout:layout];
        _curriculumCollectionView.dataSource = self;
        _curriculumCollectionView.backgroundColor = [UIColor whiteColor];
        [_curriculumCollectionView registerClass:[SACurriculumCell class] forCellWithReuseIdentifier:curriculumID];
    }
    return _curriculumCollectionView;
}

// cur_math   cur_english   cur_art   cur_bio   cur_chemistry  cur_chinese   cur_cs
// cur_geo    cur_music    cur_pe   cur_pol

- (NSArray *)curriculumArray {
    if (!_curriculumArray) {
        _curriculumArray = @[@"cur_math", @"cur_english", @"cur_math", @"cur_chinese", @"cur_math", @"cur_chinese", @"cur_math", @"cur_chinese", @"cur_math", @"cur_english", @"cur_art", @"cur_chemistry", @"cur_geo", @"cur_pe", @"cur_chinese", @"cur_pol", @"cur_music", @"cur_pe", @"cur_chemistry", @"cur_english", @"cur_bio", @"cur_cs", @"cur_chinese", @"cur_cs", @"cur_geo", @"cur_chinese", @"cur_math", @"cur_cs", @"cur_english", @"cur_math", @"cur_math", @"cur_english", @"cur_chinese", @"cur_bio", @"cur_cs", @"cur_pe", @"cur_math", @"cur_chinese", @"cur_math", @"cur_english"];
    }
    return _curriculumArray;
}

@end
