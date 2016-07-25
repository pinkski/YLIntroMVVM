//
//  PersonViewModel.h
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"

@interface PersonViewModel : NSObject

@property (nonatomic, readonly) Person *person;

@property (nonatomic, readonly) NSString *nameText;
@property (nonatomic, readonly) NSString *birthdateText;

- (instancetype)initWithPerson:(Person *)person;

@end
