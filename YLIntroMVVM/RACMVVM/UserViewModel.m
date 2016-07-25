//
//  UserViewModel.m
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "UserViewModel.h"
#import "User.h"

@interface UserViewModel ()

@property (nonatomic, strong) User *user;

@end

@implementation UserViewModel

#pragma mark - Life cycle

- (instancetype)init {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _nameText = [NSString stringWithFormat:@"我是%@", self.user.name];
    
    if (self.user.sex.integerValue == 2) {
        _sexText = [NSString stringWithFormat:@"性别：%@", @"男"];
    }
    
    _ageText = [NSString stringWithFormat:@"年龄：%li", (long)self.user.age];
    _moneyText = [NSString stringWithFormat:@"¥：%f", self.user.money];
    
    return self;
}

#pragma mark - get & set

- (User *)user {
    
    if (!_user) {
        _user = [[User alloc] init];
    }
    
    return _user;
}

@end
