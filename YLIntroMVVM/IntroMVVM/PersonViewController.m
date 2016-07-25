//
//  PersonViewController.m
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import "PersonViewController.h"

@interface PersonViewController()

@property (nonatomic, strong) UILabel *nameLabel;
@property (nonatomic, strong) UILabel *birthdateLabel;

@end

@implementation PersonViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    // 1, use MVC
    if (self.model.salutation.length > 0) {
        self.nameLabel.text = [NSString stringWithFormat:@"%@ %@ %@", self.model.salutation, self.model.firstName, self.model.lastName];
    } else {
        self.nameLabel.text = [NSString stringWithFormat:@"%@ %@", self.model.firstName, self.model.lastName];
    }
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEEE MMMM d, yyyy"];
    self.birthdateLabel.text = [dateFormatter stringFromDate:self.model.birthdate];
    
    // 2, use MVVM
    self.nameLabel.text = self.viewModel.nameText;
    self.birthdateLabel.text = self.viewModel.birthdateText;
}

@end
