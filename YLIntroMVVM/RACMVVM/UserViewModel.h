//
//  UserViewModel.h
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "User.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface UserViewModel : NSObject

@property (nonatomic, copy) NSString *nameText;
@property (nonatomic, copy) NSString *sexText;
@property (nonatomic, copy) NSString *ageText;
@property (nonatomic, copy) NSString *moneyText;

- (RACSignal *)buttonIsValidSignal;

- (RACSignal *)textIsValidSignal;

- (IBAction)buttonAction:(id)sender; 

@end
