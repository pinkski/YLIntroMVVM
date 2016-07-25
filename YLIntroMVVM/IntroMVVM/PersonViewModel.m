//
//  PersonViewModel.m
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "PersonViewModel.h"

@implementation PersonViewModel

- (instancetype)initWithPerson:(Person *)person {
    
    self = [super init];
    if (!self) {
        return nil;
    }
    
    _person = person;
    
    if (person.salutation.length > 0) {
        _nameText = [NSString stringWithFormat:@"%@ %@ %@", self.person.salutation, self.person.firstName, self.person.lastName];
    } else {
        _nameText = [NSString stringWithFormat:@"%@ %@", self.person.firstName, self.person.lastName];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
    _birthdateText = [dateFormatter stringFromDate:person.birthdate];
    
    return self;
}

@end
