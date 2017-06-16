//
//  ViewController.m
//  ForceTouchTest
//
//  Created by bit_tea on 15/06/2017.
//  Copyright © 2017 bit_tea. All rights reserved.
//

#import "ViewController.h"
#import "BTForceTouch.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    [[BTForceTouch sharedInstance] initWithTitleArray:@[@"11111",@"22222",@"22222"] subTitleArray:@[@"11111",@"22222",@"22222"] iconArray:@[@"Employee-plan_btn_se",@"Employee-plan_btn_se",@"Employee-plan_btn_se"]];
    [BTForceTouch sharedInstance].performedIndex = ^(NSInteger index) {
        if (index == 0) {
            self.view.backgroundColor = [UIColor yellowColor];
        }else{
            self.view.backgroundColor = [UIColor orangeColor];
        }
    };
}

@end
