//
//  ViewController.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/2/25.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    DrawView* dv = [DrawView new];
//    dv.frame = [UIScreen mainScreen].bounds;
//    [self.view addSubview:dv];
    CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
    [self.view addSubview:customView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
