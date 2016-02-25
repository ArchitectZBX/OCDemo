//
//  DrawViewController.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/2/25.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "DrawViewController.h"

@interface DrawViewController ()

@end

@implementation DrawViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    /*
     *画虚线圆
     */
    CAShapeLayer *dotteLine =  [CAShapeLayer layer];
    CGMutablePathRef dottePath =  CGPathCreateMutable();
    dotteLine.lineWidth = 2.0f ;
    dotteLine.strokeColor = [UIColor orangeColor].CGColor;
    dotteLine.fillColor = [UIColor clearColor].CGColor;
    CGPathAddEllipseInRect(dottePath, nil, CGRectMake(50.0f,  50.0f, 200.0f, 200.0f));
    dotteLine.path = dottePath;
    NSArray *arr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:5], nil];
    dotteLine.lineDashPhase = 1.0;
    dotteLine.lineDashPattern = arr;
    CGPathRelease(dottePath);
    [self.view.layer addSublayer:dotteLine];
    
    /*
     *画实线圆
     */
    CAShapeLayer *solidLine =  [CAShapeLayer layer];
    CGMutablePathRef solidPath =  CGPathCreateMutable();
    solidLine.lineWidth = 2.0f ;
    solidLine.strokeColor = [UIColor orangeColor].CGColor;
    solidLine.fillColor = [UIColor clearColor].CGColor;
    CGPathAddEllipseInRect(solidPath, nil, CGRectMake(50.0f,  300.0f, 200.0f, 200.0f));
    solidLine.path = solidPath;
    CGPathRelease(solidPath);
    [self.view.layer addSublayer:solidLine];
    
    /*
     *画虚线
     */
    CAShapeLayer *dotteShapeLayer = [CAShapeLayer layer];
    CGMutablePathRef dotteShapePath =  CGPathCreateMutable();
    [dotteShapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [dotteShapeLayer setStrokeColor:[[UIColor orangeColor] CGColor]];
    dotteShapeLayer.lineWidth = 2.0f ;
    NSArray *dotteShapeArr = [[NSArray alloc] initWithObjects:[NSNumber numberWithInt:10],[NSNumber numberWithInt:5], nil];
    [dotteShapeLayer setLineDashPattern:dotteShapeArr];
    CGPathMoveToPoint(dotteShapePath, NULL, 20,500);
    CGPathAddLineToPoint(dotteShapePath, NULL, 20, 285);
    CGPathAddLineToPoint(dotteShapePath, NULL, 300,285);
    [dotteShapeLayer setPath:dotteShapePath];
    CGPathRelease(dotteShapePath);
    [self.view.layer addSublayer:dotteShapeLayer];
    
    /*
     *画实线
     */
    CAShapeLayer *solidShapeLayer = [CAShapeLayer layer];
    CGMutablePathRef solidShapePath =  CGPathCreateMutable();
    [solidShapeLayer setFillColor:[[UIColor clearColor] CGColor]];
    [solidShapeLayer setStrokeColor:[[UIColor orangeColor] CGColor]];
    solidShapeLayer.lineWidth = 2.0f ;
    CGPathMoveToPoint(solidShapePath, NULL, 20, 265);
    CGPathAddLineToPoint(solidShapePath, NULL, 300,265);
    CGPathAddLineToPoint(solidShapePath, NULL, 300,50);
    [solidShapeLayer setPath:solidShapePath];
    CGPathRelease(solidShapePath);
    [self.view.layer addSublayer:solidShapeLayer];
}
@end
