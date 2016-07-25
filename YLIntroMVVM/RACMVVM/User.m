//
//  User.m
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "User.h"

@implementation User

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _name = @"yolynn";
    _sex = @(2);
    _age = 26;
    _money = 99.88;
    
    return self;
}

@end
