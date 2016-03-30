//
//  DrawView.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/2/25.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "DrawView.h"

@implementation DrawView

#define ToRadian(radian)            (radian*(M_PI/180.0))

-(void)drawRect:(CGRect)rect{
    
    [super drawRect:rect];
    
        /*边框圆
         */
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context, 255/255.0, 106/255.0, 0/255.0, 1);
    CGContextSetLineWidth(context, 5);
    CGContextAddArc(context, 50, 70, 20, 0, 2*M_PI, 0);
    CGContextDrawPath(context, kCGPathStroke);
    
    
//    //大圆环------------
//    
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, 200,ToRadian(-180), ToRadian(0), 0);
//    
//    [[UIColor yellowColor] setStroke];
////    [self.backgurondWithGaugeColor setStroke];//圆环的颜色
//    
//    CGContextSetLineWidth(ctx, 2);//大圆环的圆环粗细为40
//    
//    CGContextSetLineCap(ctx, kCGLineCapButt);
//    
//    CGContextDrawPath(ctx, kCGPathStroke);
    
    
    
    
    //小圆环（和大圆环类似）------------
    
//    CGContextAddArc(ctx, self.frame.size.width/2, self.frame.size.height/2, 80,ToRadian(45), 135*(M_PI/180.0), 0);
//    
//    [self.progressColor setStroke];
//    
//    CGContextSetLineWidth(ctx, 30);
//    
//    CGContextSetLineCap(ctx, kCGLineCapButt);
//    
//    CGContextDrawPath(ctx, kCGPathStroke);
//    
//    
//    
//    
//    
//    needleView.transform = CGAffineTransformMakeRotation(ToRadian((drawScale*TotalAangle+45)));
//    
    
    
}

//- (void)drawRect:(CGRect)rect {
//    [super drawRect:rect];
//    
//    CGRect frame = CGRectMake(50, 100, 100, 100);
//    /*画填充圆
//     */
//    CGContextRef context = UIGraphicsGetCurrentContext();
//    [[UIColor whiteColor] set];
//    CGContextFillRect(context, rect);
//    
//    CGContextAddEllipseInRect(context, frame);
//    [[UIColor orangeColor] set];
//    CGContextFillPath(context);
//    
//    /*边框圆
//     */
//    CGContextSetRGBStrokeColor(context, 255/255.0, 106/255.0, 0/255.0, 1);
//    CGContextSetLineWidth(context, 5);
//    CGContextAddArc(context, 50, 70, 20, 0, 2*M_PI, 0);
//    CGContextDrawPath(context, kCGPathStroke);
//    
//    /*画直线
//     */
//    CGRect markFrame = CGRectMake(100, 250, 200, 200);
//    [[UIColor orangeColor] set];
//    CGContextSetLineWidth(context, 4);
//    CGPoint points[5];
//    points[0] = CGPointMake(markFrame.origin.x,markFrame.origin.y);
//    points[1] = CGPointMake(markFrame.origin.x+markFrame.size.width/4, markFrame.origin.y+markFrame.size.height/2);
//    points[2] = CGPointMake(markFrame.origin.x+markFrame.size.width/2, markFrame.origin.y+5);
//    points[3] = CGPointMake(markFrame.origin.x+markFrame.size.width/4*3,markFrame.origin.y+markFrame.size.height/2);
//    points[4] = CGPointMake(markFrame.origin.x+markFrame.size.width, markFrame.origin.y);
//    
//    CGContextAddLines(context, points, 5);
//    CGContextDrawPath(context, kCGPathStroke);
//    //边框圆
//    CGContextSetLineWidth(context, 5);
//    CGContextAddArc(context, markFrame.origin.x+markFrame.size.width/2, markFrame.origin.y+markFrame.size.height/2, markFrame.size.height/2-2, 0, 2*M_PI, 0);
//    CGContextDrawPath(context, kCGPathStroke);
//    
//    /*曲线
//     */
//    [[UIColor redColor] set];
//    
//    CGContextSetLineWidth(context, 4.0);
//    CGContextSetStrokeColorWithColor(context, [UIColor orangeColor].CGColor);
//    CGContextMoveToPoint(context, 300, 370);
//    CGContextAddCurveToPoint(context,  193, 320, 100, 370, 100, 370);
//    CGContextStrokePath(context);
//}


@end
