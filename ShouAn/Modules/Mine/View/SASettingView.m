//
//  SASettingView.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/12.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SASettingView.h"
#import "SABaseCell.h"

static NSString *settingCellID = @"settingCell";

@implementation SASettingView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self.tableView registerClass:[SABaseCell class] forCellReuseIdentifier:settingCellID];
    }
    return self;
}

- (void)setDataSource:(NSArray *)dataSource {
    [super setDataSource:dataSource];
    
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    SABaseCell *settingCell = [tableView dequeueReusableCellWithIdentifier:settingCellID forIndexPath:indexPath];
    settingCell.titleLabel.text = self.dataSource[indexPath.row];
    settingCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    if (indexPath.row == 1) {
        settingCell.accessoryType = UITableViewCellAccessoryNone;
        settingCell.subTitleLabel.text = [NSString stringWithFormat:@"%.2fKB", [self readCacheSize].floatValue / 1024 / 1024];
    }
    return settingCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    self.cellSelectedBlock(indexPath);
}

/**
 * 读取缓存
 * @return 缓存大小
 */
- (NSNumber *)readCacheSize {
    NSString *cachePath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    return [self folderSizeAtPath:cachePath];
}

/**
 * 指定文件夹的大小
 * @param folderPath 文件夹路径
 * @return 文件大小
 */
- (NSNumber *)folderSizeAtPath:(NSString *)folderPath {
    NSFileManager *manager = [NSFileManager defaultManager];
    if (![manager fileExistsAtPath:folderPath]) return @0;
    NSEnumerator *childFilesEnumerator = [[manager subpathsAtPath:folderPath] objectEnumerator];
    NSString *fileName;
    long long folderSize = 0;
    while ((fileName = [childFilesEnumerator nextObject]) != nil) {
        //获取文件全路径
        NSString *fileAbsolutePath = [folderPath stringByAppendingPathComponent:fileName];
        folderSize += [self fileSizeAtPath:fileAbsolutePath];
    }
    
    return @(folderSize);
}

/**
 * 指定路径的大小
 * @param filePath 路径
 * @return 文件大小
 */
- (long long)fileSizeAtPath:(NSString *)filePath {
    NSFileManager *manager = [NSFileManager defaultManager];
    if ([manager fileExistsAtPath:filePath]) {
        return [[manager attributesOfItemAtPath:filePath error:nil] fileSize];
    }
    
    return 0;
}

@end
