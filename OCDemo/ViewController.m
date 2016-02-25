//
//  ViewController.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/2/25.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    DrawView* dv = [DrawView new];
    dv.frame = [UIScreen mainScreen].bounds;
    [self.view addSubview:dv];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
