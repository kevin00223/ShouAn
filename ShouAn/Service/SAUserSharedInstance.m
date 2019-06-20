//
//  SAUserSharedInstance.m
//  ShouAn
//
//  Created by 李凯 on 2019/6/20.
//  Copyright © 2019 LK. All rights reserved.
//

#import "SAUserSharedInstance.h"

@implementation SAUserSharedInstance

static SAUserSharedInstance *_instance;

+ (instancetype)sharedInstance {
    return [[self alloc]init];
}

- (instancetype)init {
    self = [super init];
    if (self) {
        
    }
    return self;
}

+ (instancetype)allocWithZone:(struct _NSZone *)zone {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [super allocWithZone:zone];
    });
    return _instance;
}

- (id)copyWithZone:(NSZone *)zone {
    return _instance;
}

- (id)mutableCopyWithZone:(NSZone *)zone {
    return _instance;
}

@end
