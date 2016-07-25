//
//  PersonViewController.h
//  YLIntroMVVM
//
//  Created by 张晓岚 on 16/7/25.
//  Copyright © 2016年 ThinkMobile. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"
#import "PersonViewModel.h"

@interface PersonViewController : UIViewController

@property (nonatomic, strong) Person *model;    ///<
@property (nonatomic, strong) PersonViewModel *viewModel;    ///<

@end
