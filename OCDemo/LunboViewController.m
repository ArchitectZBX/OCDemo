//
//  LunboViewController.m
//  OCDemo
//
//  Created by Architect_ZBX on 16/3/30.
//  Copyright © 2016年 zhaobingxu. All rights reserved.
//

#import "LunboViewController.h"

@interface LunboViewController ()

@property (nonatomic,retain) UIScrollView* scrollview;
@property (nonatomic,retain) UIPageControl* pageControl;
@property (nonatomic,strong) NSTimer* timer;

@end

@implementation LunboViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _scrollview = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, WScreen, HScreen/3)];
    [self.view addSubview:_scrollview];
    _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(100, 100, 40, 20)];
    [self.view addSubview:_pageControl];
    
    //    图片的宽
    CGFloat imageW = self.scrollview.frame.size.width;
    //    CGFloat imageW = 300;
    //    图片高
    CGFloat imageH = self.scrollview.frame.size.height;
    //    图片的Y
    CGFloat imageY = 0;
    //    图片中数
    NSInteger totalCount = 5;
    //   1.添加5张图片
    for (int i = 0; i < totalCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] init];
        //        图片X
        CGFloat imageX = i * imageW;
        //        设置frame
        imageView.frame = CGRectMake(imageX, imageY, imageW, imageH);
        //        设置图片
        NSString *name = [NSString stringWithFormat:@"img_0%d", i + 1];
        imageView.image = [UIImage imageNamed:name];
        //        隐藏指示条
        self.scrollview.showsHorizontalScrollIndicator = NO;
        
        [self.scrollview addSubview:imageView];
    }
    //    2.设置scrollview的滚动范围
    CGFloat contentW = totalCount *imageW;
    //不允许在垂直方向上进行滚动
    self.scrollview.contentSize = CGSizeMake(contentW, 0);
    
    //    3.设置分页
    self.scrollview.pagingEnabled = YES;
    
    //    4.监听scrollview的滚动
    self.scrollview.delegate = self;
    
    [self addTimer];
}

- (void)nextImage
{
    int page = (int)self.pageControl.currentPage;
    if (page == 4) {
        page = 0;
    }else
    {
        page++;
    }
    
    //  滚动scrollview
    CGFloat x = page * self.scrollview.frame.size.width;
    self.scrollview.contentOffset = CGPointMake(x, 0);
}

// scrollview滚动的时候调用
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"滚动中");
    //    计算页码
    //    页码 = (contentoffset.x + scrollView一半宽度)/scrollView宽度
    CGFloat scrollviewW =  scrollView.frame.size.width;
    CGFloat x = scrollView.contentOffset.x;
    int page = (x + scrollviewW / 2) /  scrollviewW;
    self.pageControl.currentPage = page;
}

// 开始拖拽的时候调用
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    //    关闭定时器(注意点; 定时器一旦被关闭,无法再开启)
    //    [self.timer invalidate];
    [self removeTimer];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    //    开启定时器
    [self addTimer];
}

/**
 100  *  开启定时器
 101  */
- (void)addTimer{
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
}
/**
 108  *  关闭定时器
 109  */
- (void)removeTimer
{
    [self.timer invalidate];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
