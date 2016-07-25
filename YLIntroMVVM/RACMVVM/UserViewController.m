
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
    
    [self setupBinding];
}

#pragma mark - View

- (void)setupView {
    
    self.title = @"我的标题";
}

#pragma mark - Binding

- (void)setupBinding {
    
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
    
    [self.viewModel.textIsValidSignal subscribeNext:^(NSString *name) {
       
        @strongify(self);
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Forbidden Name!"
                                                        message:[NSString stringWithFormat:@"The name %@ has been forbidden!",name]
                                                       delegate:nil
                                              cancelButtonTitle:@"Ok"
                                              otherButtonTitles:nil];
        [alert show];
        self.viewModel.nameText = @"";
    }];
    
    // button
    RAC(self.firstButton, enabled) = self.viewModel.buttonIsValidSignal;
    
    [self.firstButton addTarget:self.viewModel action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [[[[self.firstButton rac_signalForControlEvents:UIControlEventTouchUpInside]
       skip:0] take:1] subscribeNext:^(id x) {
        @strongify(self);
        self.firstTextField.enabled = NO;
        self.nameLabel.hidden = YES;
    }];
    
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
