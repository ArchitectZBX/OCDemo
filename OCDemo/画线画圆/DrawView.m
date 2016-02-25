//
//  DrawView.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/2/25.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    
    CGRect frame = CGRectMake(50, 100, 100, 100);
    /*画填充圆
     */
    CGContextRef context = UIGraphicsGetCurrentContext();
    [[UIColor whiteColor] set];
    CGContextFillRect(context, rect);
    
    CGContextAddEllipseInRect(context, frame);
    [[UIColor orangeColor] set];
    CGContextFillPath(context);
    
    /*边框圆
     */
    CGContextSetRGBStrokeColor(context, 255/255.0, 106/255.0, 0/255.0, 1);
    CGContextSetLineWidth(context, 5);
    CGContextAddArc(context, 50, 70, 20, 0, 2*M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    /*画直线
     */
    CGRect markFrame = CGRectMake(100, 250, 200, 200);
    [[UIColor orangeColor] set];
    CGContextSetLineWidth(context, 4);
    CGPoint points[5];
    points[0] = CGPointMake(markFrame.origin.x,markFrame.origin.y);
    points[1] = CGPointMake(markFrame.origin.x+markFrame.size.width/4, markFrame.origin.y+markFrame.size.height/2);
    points[2] = CGPointMake(markFrame.origin.x+markFrame.size.width/2, markFrame.origin.y+5);
    points[3] = CGPointMake(markFrame.origin.x+markFrame.size.width/4*3,markFrame.origin.y+markFrame.size.height/2);
    points[4] = CGPointMake(markFrame.origin.x+markFrame.size.width, markFrame.origin.y);
    
    CGContextAddLines(context, points, 5);
    CGContextDrawPath(context, kCGPathStroke);
    //边框圆
    CGContextSetLineWidth(context, 5);
    CGContextAddArc(context, markFrame.origin.x+markFrame.size.width/2, markFrame.origin.y+markFrame.size.height/2, markFrame.size.height/2-2, 0, 2*M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    /*曲线
     */
    [[UIColor redColor] set];
    
    CGContextSetLineWidth(context, 4.0);
    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
    CGContextMoveToPoint(context, 300, 370);
    CGContextAddCurveToPoint(context,  193, 320, 100, 370, 100, 370);
    CGContextStrokePath(context);
}


@end
