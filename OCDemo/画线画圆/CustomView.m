//
//  CustomView.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/2/26.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}


// 覆盖drawRect方法，你可以在此自定义绘画和动画
- (void)drawRect:(CGRect)rect
{
    //An opaque type that represents a Quartz 2D drawing environment.
    //一个不透明类型的Quartz 2D绘画环境,相当于一个画布,你可以在上面任意绘画
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    /*写文字*/
    CGContextSetRGBFillColor (context,  1, 0, 0, 1.0);//设置填充颜色
    UIFont  *font = [UIFont boldSystemFontOfSize:15.0];//设置
    [@"画圆：" drawInRect:CGRectMake(10, 20, 80, 20) withFont:font];
    [@"画线及孤线：" drawInRect:CGRectMake(10, 80, 100, 20) withFont:font];
    [@"画矩形：" drawInRect:CGRectMake(10, 120, 80, 20) withFont:font];
    [@"画扇形和椭圆：" drawInRect:CGRectMake(10, 160, 110, 20) withFont:font];
    [@"画三角形：" drawInRect:CGRectMake(10, 220, 80, 20) withFont:font];
    [@"画圆角矩形：" drawInRect:CGRectMake(10, 260, 100, 20) withFont:font];
    [@"画贝塞尔曲线：" drawInRect:CGRectMake(10, 300, 100, 20) withFont:font];
    [@"图片：" drawInRect:CGRectMake(10, 340, 80, 20) withFont:font];
    
    /*画圆*/
    //边框圆
    CGContextSetRGBStrokeColor(context,1,1,1,1.0);//画笔线的颜色
    CGContextSetLineWidth(context, 1.0);//线的宽度
    //void CGContextAddArc(CGContextRef c,CGFloat x, CGFloat y,CGFloat radius,CGFloat startAngle,CGFloat endAngle, int clockwise)1弧度＝180°/π （≈57.3°） 度＝弧度×180°/π 360°＝360×π/180 ＝2π 弧度
    // x,y为圆点坐标，radius半径，startAngle为开始的弧度，endAngle为 结束的弧度，clockwise 0为顺时针，1为逆时针。
    CGContextAddArc(context, 100, 20, 15, 0, 2*PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathStroke); //绘制路径
    
    //填充圆，无边框
    CGContextAddArc(context, 150, 30, 30, 0, 2*PI, 0); //添加一个圆
    CGContextDrawPath(context, kCGPathFill);//绘制填充
    
    //画大圆并填充颜
    UIColor*aColor = [UIColor colorWithRed:1 green:0.0 blue:0 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    CGContextSetLineWidth(context, 3.0);//线的宽度
    CGContextAddArc(context, 250, 40, 40, 0, 2*PI, 0); //添加一个圆
    //kCGPathFill填充非零绕数规则,kCGPathEOFill表示用奇偶规则,kCGPathStroke路径,kCGPathFillStroke路径填充,kCGPathEOFillStroke表示描线，不是填充
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径加填充
    
    /*画线及孤线*/
    //画线
    CGPoint aPoints[2];//坐标点
    aPoints[0] =CGPointMake(100, 80);//坐标1
    aPoints[1] =CGPointMake(130, 80);//坐标2
    //CGContextAddLines(CGContextRef c, const CGPoint points[],size_t count)
    //points[]坐标数组，和count大小
    CGContextAddLines(context, aPoints, 2);//添加线
    CGContextDrawPath(context, kCGPathStroke); //根据坐标绘制路径
    
    //画笑脸弧线
    //左
    CGContextSetRGBStrokeColor(context, 0, 0, 1, 1);//改变画笔颜色
    CGContextMoveToPoint(context, 140, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 148, 68, 156, 80, 10);
    CGContextStrokePath(context);//绘画路径
    
    //右
    CGContextMoveToPoint(context, 160, 80);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 168, 68, 176, 80, 10);
    CGContextStrokePath(context);//绘画路径
    
    //右
    CGContextMoveToPoint(context, 150, 90);//开始坐标p1
    //CGContextAddArcToPoint(CGContextRef c, CGFloat x1, CGFloat y1,CGFloat x2, CGFloat y2, CGFloat radius)
    //x1,y1跟p1形成一条线的坐标p2，x2,y2结束坐标跟p3形成一条线的p3,radius半径,注意, 需要算好半径的长度,
    CGContextAddArcToPoint(context, 158, 102, 166, 90, 10);
    CGContextStrokePath(context);//绘画路径
    //注，如果还是没弄明白怎么回事，请参考：http://donbe.blog.163.com/blog/static/138048021201052093633776/
    
    /*画矩形*/
    CGContextStrokeRect(context,CGRectMake(100, 120, 10, 10));//画方框
    CGContextFillRect(context,CGRectMake(120, 120, 10, 10));//填充框
    //矩形，并填弃颜色
    CGContextSetLineWidth(context, 2.0);//线的宽度
    aColor = [UIColor blueColor];//blue蓝色
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    aColor = [UIColor yellowColor];
    CGContextSetStrokeColorWithColor(context, aColor.CGColor);//线框颜色
    CGContextAddRect(context,CGRectMake(140, 120, 60, 30));//画方框
    CGContextDrawPath(context, kCGPathFillStroke);//绘画路径
    
    
    
    /*
     0 CGContextRef context = UIGraphicsGetCurrentContext(); 设置上下文
     1 CGContextMoveToPoint 开始画线
     2 CGContextAddLineToPoint 画直线
     
     4 CGContextAddEllipseInRect 画一椭圆
     4 CGContextSetLineCap 设置线条终点形状
     4 CGContextSetLineDash 画虚线
     4 CGContextAddRect 画一方框
     4 CGContextStrokeRect 指定矩形
     4 CGContextStrokeRectWithWidth 指定矩形线宽度
     4 CGContextStrokeLineSegments 一些直线
     
     5 CGContextAddArc 画已曲线 前俩店为中心 中间俩店为起始弧度 最后一数据为0则顺时针画 1则逆时针
     5 CGContextAddArcToPoint(context,0,0, 2, 9, 40);//先画俩条线从point 到 弟1点 ， 从弟1点到弟2点的线  切割里面的圆
     6 CGContextSetShadowWithColor 设置阴影
     7 CGContextSetRGBFillColor 这只填充颜色
     7 CGContextSetRGBStrokeColor 画笔颜色设置
     7 CGContextSetFillColorSpace 颜色空间填充
     7 CGConextSetStrokeColorSpace 颜色空间画笔设置
     8 CGContextFillRect 补充当前填充颜色的rect
     8 CGContextSetAlaha 透明度
     
     9 CGContextTranslateCTM 改变画布位置
     10 CGContextSetLineWidth 设置线的宽度
     11 CGContextAddRects 画多个线
     12 CGContextAddQuadCurveToPoint 画曲线
     13 CGContextStrokePath 开始绘制图片
     13 CGContextDrawPath 设置绘制模式
     14 CGContextClosePath 封闭当前线路
     15 CGContextTranslateCTM(context, 0, rect.size.height);    CGContextScaleCTM(context, 1.0, -1.0);反转画布
     16 CGContextSetInterpolationQuality 背景内置颜色质量等级
     16 CGImageCreateWithImageInRect 从原图片中取小图
     
     17 字符串的 写入可用  nsstring本身的画图方法 - (CGSize)drawInRect:(CGRect)rect withFont:(UIFont *)font lineBreakMode:(UILineBreakMode)lineBreakMode alignment:(UITextAlignment)alignment;来写进去即可
     
     18对图片放大缩小的功能就是慢了点
     UIGraphicsBeginImageContext(newSize);
     UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
     UIGraphicsEndImageContext();
     
     19 CGColorGetComponents（） 返回颜色的各个直 以及透明度 可用只读const float 来接收  是个数组
     
     20 画图片 CGImageRef image＝CGImageRetain(img.CGImage);
     CGContextDrawImage(context, CGRectMake(10.0, height -
     100.0, 90.0, 90.0), image);
     
     21 实现逐变颜色填充方法 CGContextClip(context);
     CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
     CGFloat colors[] =
     {
     204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
     29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
     0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
     };
     CGGradientRef gradient = CGGradientCreateWithColorComponents
     (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));
     CGColorSpaceRelease(rgb);
     CGContextDrawLinearGradient(context, gradient,CGPointMake
     (0.0,0.0) ,CGPointMake(0.0,self.frame.size.height),
     kCGGradientDrawsBeforeStartLocation);
     
     22 注:  画完图后,必须
     先用CGContextStrokePath来描线,即形状
     后用CGContextFillPath来填充形状内的颜色.
     
     填充一个路径的时候，路径里面的子路径都是独立填充的。
     假如是重叠的路径，决定一个点是否被填充，有两种规则
     1,nonzero winding number rule:非零绕数规则，假如一个点被从左到右跨过，计数器+1，从右到左跨过，计数器-1，最后，如果结果是0，那么不填充，如果是非零，那么填充。
     2,even-odd rule: 奇偶规则，假如一个点被跨过，那么+1，最后是奇数，那么要被填充，偶数则不填充，和方向没有关系。
     
     Function
     Description
     CGContextEOFillPath
     使用奇偶规则填充当前路径
     CGContextFillPath
     使用非零绕数规则填充当前路径
     CGContextFillRect
     填充指定的矩形
     CGContextFillRects
     填充指定的一些矩形
     CGContextFillEllipseInRect
     填充指定矩形中的椭圆
     CGContextDrawPath
     两个参数决定填充规则，kCGPathFill表示用非零绕数规则，kCGPathEOFill表示用奇偶规则，kCGPathFillStroke表示填充，kCGPathEOFillStroke表示描线，不是填充
     
     设置当一个颜色覆盖上另外一个颜色，两个颜色怎么混合
     默认方式是
     result = (alpha * foreground) + (1 - alpha) * background
     
     CGContextSetBlendMode :设置blend mode.
     CGContextSaveGState :保存blend mode.
     CGContextRestoreGState:在没有保存之前，用这个函数还原blend mode.
     CGContextSetBlendMode 混合俩种颜色

     
     
     
     */
    
    
    
    
    
    
    
    
    
    
    
    //矩形，并填弃渐变颜色
    //关于颜色参考http://blog.sina.com.cn/s/blog_6ec3c9ce01015v3c.html
    //http://blog.csdn.net/reylen/article/details/8622932
    //第一种填充方式，第一种方式必须导入类库quartcore并#import <QuartzCore/QuartzCore.h>，这个就不属于在context上画，而是将层插入到view层上面。那么这里就设计到Quartz Core 图层编程了。
    CAGradientLayer *gradient1 = [CAGradientLayer layer];
    gradient1.frame = CGRectMake(240, 120, 60, 30);
    gradient1.colors = [NSArray arrayWithObjects:(id)[UIColor whiteColor].CGColor,
                        (id)[UIColor grayColor].CGColor,
                        (id)[UIColor blackColor].CGColor,
                        (id)[UIColor yellowColor].CGColor,
                        (id)[UIColor blueColor].CGColor,
                        (id)[UIColor redColor].CGColor,
                        (id)[UIColor greenColor].CGColor,
                        (id)[UIColor orangeColor].CGColor,
                        (id)[UIColor brownColor].CGColor,nil];
    [self.layer insertSublayer:gradient1 atIndex:0];
    //第二种填充方式
    CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
    CGFloat colors[] =
    {
        1,1,1, 1.00,
        1,1,0, 1.00,
        1,0,0, 1.00,
        1,0,1, 1.00,
        0,1,1, 1.00,
        0,1,0, 1.00,
        0,0,1, 1.00,
        0,0,0, 1.00,
    };
    CGGradientRef gradient = CGGradientCreateWithColorComponents
    (rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0])*4));//形成梯形，渐变的效果
    CGColorSpaceRelease(rgb);
    //画线形成一个矩形
    //CGContextSaveGState与CGContextRestoreGState的作用
    /*
     CGContextSaveGState函数的作用是将当前图形状态推入堆栈。之后，您对图形状态所做的修改会影响随后的描画操作，但不影响存储在堆栈中的拷贝。在修改完成后，您可以通过CGContextRestoreGState函数把堆栈顶部的状态弹出，返回到之前的图形状态。这种推入和弹出的方式是回到之前图形状态的快速方法，避免逐个撤消所有的状态修改；这也是将某些状态（比如裁剪路径）恢复到原有设置的唯一方式。
     */
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 220, 90);
    CGContextAddLineToPoint(context, 240, 90);
    CGContextAddLineToPoint(context, 240, 110);
    CGContextAddLineToPoint(context, 220, 110);
    CGContextClip(context);//context裁剪路径,后续操作的路径
    //CGContextDrawLinearGradient(CGContextRef context,CGGradientRef gradient, CGPoint startPoint, CGPoint endPoint,CGGradientDrawingOptions options)
    //gradient渐变颜色,startPoint开始渐变的起始位置,endPoint结束坐标,options开始坐标之前or开始之后开始渐变
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (220,90) ,CGPointMake(240,110),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context
    
    //再写一个看看效果
    CGContextSaveGState(context);
    CGContextMoveToPoint(context, 260, 90);
    CGContextAddLineToPoint(context, 280, 90);
    CGContextAddLineToPoint(context, 280, 100);
    CGContextAddLineToPoint(context, 260, 100);
    CGContextClip(context);//裁剪路径
    //说白了，开始坐标和结束坐标是控制渐变的方向和形状
    CGContextDrawLinearGradient(context, gradient,CGPointMake
                                (260, 90) ,CGPointMake(260, 100),
                                kCGGradientDrawsAfterEndLocation);
    CGContextRestoreGState(context);// 恢复到之前的context
    
    //下面再看一个颜色渐变的圆
    CGContextDrawRadialGradient(context, gradient, CGPointMake(300, 100), 0.0, CGPointMake(300, 100), 10, kCGGradientDrawsBeforeStartLocation);
    
    /*画扇形和椭圆*/
    //画扇形，也就画圆，只不过是设置角度的大小，形成一个扇形
    aColor = [UIColor colorWithRed:0 green:1 blue:1 alpha:1];
    CGContextSetFillColorWithColor(context, aColor.CGColor);//填充颜色
    //以10为半径围绕圆心画指定角度扇形
    CGContextMoveToPoint(context, 160, 180);
    CGContextAddArc(context, 160, 180, 30,  -60 * PI / 180, -120 * PI / 180, 1);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //绘制路径
    
    //画椭圆
    CGContextAddEllipseInRect(context, CGRectMake(160, 180, 20, 8)); //椭圆
    CGContextDrawPath(context, kCGPathFillStroke);
    
    /*画三角形*/
    //只要三个点就行跟画一条线方式一样，把三点连接起来
    CGPoint sPoints[3];//坐标点
    sPoints[0] =CGPointMake(100, 220);//坐标1
    sPoints[1] =CGPointMake(130, 220);//坐标2
    sPoints[2] =CGPointMake(130, 160);//坐标3
    CGContextAddLines(context, sPoints, 3);//添加线
    CGContextClosePath(context);//封起来
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    /*画圆角矩形*/
    float fw = 180;
    float fh = 280;
    
    CGContextMoveToPoint(context, fw, fh-20);  // 开始坐标右边开始
    CGContextAddArcToPoint(context, fw, fh, fw-20, fh, 10);  // 右下角角度
    CGContextAddArcToPoint(context, 120, fh, 120, fh-20, 10); // 左下角角度
    CGContextAddArcToPoint(context, 120, 250, fw-20, 250, 10); // 左上角
    CGContextAddArcToPoint(context, fw, 250, fw, fh-20, 10); // 右上角
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke); //根据坐标绘制路径
    
    /*画贝塞尔曲线*/
    //二次曲线
    CGContextMoveToPoint(context, 120, 300);//设置Path的起点
    CGContextAddQuadCurveToPoint(context,190, 310, 120, 390);//设置贝塞尔曲线的控制点坐标和终点坐标
    CGContextStrokePath(context);
    //三次曲线函数
    CGContextMoveToPoint(context, 200, 300);//设置Path的起点
    CGContextAddCurveToPoint(context,250, 280, 250, 400, 280, 300);//设置贝塞尔曲线的控制点坐标和控制点坐标终点坐标
    CGContextStrokePath(context);
    
    
    /*图片*/
    UIImage *image = [UIImage imageNamed:@"apple.jpg"];
    [image drawInRect:CGRectMake(60, 340, 20, 20)];//在坐标中画出图片
    //    [image drawAtPoint:CGPointMake(100, 340)];//保持图片大小在point点开始画图片，可以把注释去掉看看
    CGContextDrawImage(context, CGRectMake(100, 340, 20, 20), image.CGImage);//使用这个使图片上下颠倒了，参考http://blog.csdn.net/koupoo/article/details/8670024
    
    //    CGContextDrawTiledImage(context, CGRectMake(0, 0, 20, 20), image.CGImage);//平铺图
    
}


@end
