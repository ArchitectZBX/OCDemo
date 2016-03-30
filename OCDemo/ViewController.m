//
//  ViewController.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/2/25.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "ViewController.h"
#import "CustomView.h"
#import "Masonry.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 100)];
//    view.backgroundColor = [UIColor yellowColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 5, 0, 0)];
//    [label setFont:[UIFont systemFontOfSize:20]];
//    label.text = @"hello wdszgrf阿道夫控件；f";
//    NSLog(@"CGSizeZero的大小为%@",CGSizeZero);
//    CGSize sizeThatFits = [label sizeThatFits:CGSizeZero];
//    NSLog(@"---- %f  %f ----", sizeThatFits.width, sizeThatFits.height);
//    // output:  ---- 117.000000  24.000000 ----
//    
//    NSLog(@"**** %f  %f ****", label.frame.size.width, label.frame.size.height);
//    // output:  **** 0.000000  0.000000 **** 说明sizeThatSize并没有改变原始label的大小
//    
//    [label sizeToFit];  // 这样搞就直接改变了这个label的宽和高，使它根据上面字符串的大小做合适的改变
//    [label setCenter:CGPointMake(100, 50)];
//    NSLog(@"==== %f %f ====", label.frame.size.width, label.frame.size.height);
//    // output:   ==== 117.000000 24.000000 ====
//    
//    [view addSubview:label];
//    [self.view addSubview:view];
    
    Student* s = [[Student alloc] init];
    [s study];
    
//    MyView* my = [MyView new];
//    my.frame = self.view.frame;
//    self.view.backgroundColor = [UIColor redColor];
//    [self.view addSubview:my];
    
//    UIImageView *img = [[UIImageView alloc] init];
//    [img mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.equalTo(self.view);
//    }];
//    DrawView* dv = [DrawView new];
//    dv.frame = [UIScreen mainScreen].bounds;
//    [self.view addSubview:dv];
//    CustomView *customView = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, 320, self.view.frame.size.height)];
//    [self.view addSubview:customView];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
