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

#pragma mark - Signal

- (RACSignal *)buttonIsValidSignal {

    return [RACSignal combineLatest:@[RACObserve(self, nameText), RACObserve(self, ageText)]
                             reduce:^id(NSString *nameStr, NSString *ageStr){
                                 
                                 
                                 return @((nameStr.length > 0) && ([ageStr containsString:@"年龄"]));
                             }];
}

- (RACSignal *)textIsValidSignal {
    
    return [RACObserve(self, nameText) filter:^BOOL(NSString *str) {
        
        return ([str containsString:@"yolynn"]);
    }];
}

#pragma mark - Action

- (IBAction)buttonAction:(id)sender {

    //using with @strongify(self) this makes sure that self isn't retained in the blocks
    //this is declared int libextobjc's EXTScope.h file
    @weakify(self);
    
    [[RACScheduler scheduler] schedule:^{
        sleep(1);
        //pretend we are uploading to a server on a backround thread...
        //dont ever put sleep in your code
        //upload player & points...
        
        [[RACScheduler mainThreadScheduler] schedule:^{
            //this creates a reference to weak self ( @weakify(self); )
            //makes sure self isn't retained
            //TODO: shouldn't reference a UI element in the view model. probably need an upload signal signal
            @strongify(self);
            NSString *msg = [NSString stringWithFormat:@"Updated %@ with .0f points", self.nameText];
            
            UIAlertView *alert = [[UIAlertView alloc]initWithTitle:@"Upload Successfull" message:msg delegate:nil
                                                  cancelButtonTitle:@"ok" otherButtonTitles:nil];
            [alert show];
        }];
    }];
}

#pragma mark - get & set

- (User *)user {
    
    if (!_user) {
        _user = [[User alloc] init];
    }
    
    return _user;
}

@end
