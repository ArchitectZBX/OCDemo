//
//  MyView.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/3/12.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "MyView.h"

@implementation MyView


- (void)drawRect:(CGRect)rect{ //创建路径并获取句柄
    CGMutablePathRef path = CGPathCreateMutable(); //指定矩形
    CGRect rectangle = self.bounds; //将矩形添加到路径中
    CGPathAddRect(path,NULL, rectangle); //获取上下文
    CGContextRef currentContext = UIGraphicsGetCurrentContext(); //将路径添加到上下文
    CGContextAddPath(currentContext, path); //设置矩形填充色 CGContextSetFillColorWithColor(currentContext,
    [UIColor colorWithWhite:0.0f alpha:0.8f].CGColor;
    CGContextFillRect(currentContext, rectangle);
    CGContextClearRect(currentContext, CGRectMake(50.f, 50.f, 220.f, 220.f));//绘制
    CGContextDrawPath(currentContext, kCGPathFillStroke);
    CGPathRelease(path);
}

@end
