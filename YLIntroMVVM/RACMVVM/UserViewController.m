
//
//  UserViewController.m
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "UserViewController.h"
#import "UserViewModel.h"
#import <ReactiveCocoa/ReactiveCocoa.h>

@interface UserViewController()

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *moneyLabel;

@property (weak, nonatomic) IBOutlet UITextField *firstTextField;
@property (weak, nonatomic) IBOutlet UIButton *firstButton;
@property (weak, nonatomic) IBOutlet UIStepper *firstStepper;


@property (nonatomic, strong) UserViewModel *viewModel;

@end

@implementation UserViewController

#pragma mark - Life cycle

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self setupView];
}

#pragma mark - View

- (void)setupView {
    
    // label
    RAC(self.nameLabel, text) = RACObserve(self.viewModel, nameText);
    RAC(self.sexLabel, text) = [RACObserve(self.viewModel, sexText) map:^id(NSString *value) {
        
        return [NSString stringWithFormat:@"我的%@", value];
    }];
    RAC(self.ageLabel, text) = RACObserve(self.viewModel, ageText);
    RAC(self.moneyLabel, text) = RACObserve(self.viewModel, moneyText);
    
    // textField
    RAC(self.firstTextField, text) = [RACObserve(self.viewModel, nameText) distinctUntilChanged];
    @weakify(self)
    [[self.firstTextField.rac_textSignal distinctUntilChanged] subscribeNext:^(NSString *x) {
        
        @strongify(self)
        self.viewModel.nameText = x;
    }];
    
    // button
    
    
    // stepper
    
    
}

#pragma mark - set & get

- (UserViewModel *)viewModel {
    
    if (!_viewModel) {
        _viewModel = [UserViewModel new];
    }
    
    return _viewModel;
}

@end
