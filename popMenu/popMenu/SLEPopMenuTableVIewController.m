//
//  SLEPopMenuTableVIewController.m
//  popMenu
//
//  Created by mzyw on 16/10/10.
//  Copyright © 2016年 宋帅超. All rights reserved.
//

#import "SLEPopMenuTableVIewController.h"
#import "SLEPopMenuView.h"

@interface SLEPopMenuTableVIewController ()

@end

@implementation SLEPopMenuTableVIewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setTitle:@"弹出窗口" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(popMenu) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    button.frame = CGRectMake(90, 90, 90, 90);
    [button sizeToFit];
}


- (void)popMenu
{


    [SLEPopMenuView sle_showPopMenuViewToView:self.view];

}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{

    [SLEPopMenuView sle_dismissPopMenuView];

}




@end
