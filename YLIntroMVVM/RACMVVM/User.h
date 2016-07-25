//
//  User.h
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *name;    ///<
@property (nonatomic, strong) NSNumber *sex;    ///<
@property (nonatomic, assign) NSInteger age;    ///<
@property (nonatomic, assign) double money;    ///<

@end
