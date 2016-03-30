OCDemo/LXBannerView.h //
//  LXBannerScrollView.m
//  banner
//
//  Created by guolongxiang on 16/3/26.
//  Copyright © 2016年 guolongxiang. All rights reserved.
//

#import "LXBannerView.h"
typedef void(^resultBlock)(NSInteger index);

@interface BannerScroll()

@end
@implementation BannerScroll

/**注意:避免可能出现的手势冲突,当如果检测到ScrollView上不是Dragging动作,则传递给下一响应者UIView*/
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragging) {
        [[self nextResponder] touchesBegan:touches withEvent:event];
    }
    [super touchesBegan:touches withEvent:event];
}

-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (!self.dragging) {
        [[self nextResponder] touchesEnded:touches withEvent:event];
    }
    [super touchesEnded:touches withEvent:event];
}

@end

@interface LXBannerView()<UIScrollViewDelegate>
{
    UIScrollView*   _scrollView;
    UIPageControl*  _pageViewControl;
    
    UIImageView*    _leftImageView;
    UIImageView*    _rightImageView;
    UIImageView*    _centerImageView;
    NSArray*        _images;
    NSArray*        _imageUrls;
    
    NSTimeInterval  _duration;
    NSTimer*        _timer;
    
    NSInteger       _currentImageIndex;
    CGFloat         _imageWidth;
    CGFloat         _imageHeight;

    resultBlock     _clickBlock;
}
@property (strong, nonatomic) NSTimer* timer;
@end

@implementation LXBannerView
- (void)setTimer:(NSTimer *)timer {
    if (_timer > 0) {
        [self stopTimerScrollView];
        [self startTimerScrollView];
    }
}

- (instancetype)initWithNetWorkImageUrls:(NSArray* )urls viewFrame:(CGRect)frame duration:(NSTimeInterval)duration clickCompliment:(void(^)(NSInteger index))clickBlock{
    if (self = [super init]) {
        _imageHeight    = frame.size.height;
        _imageWidth     = frame.size.width;
        _imageUrls      = urls;
        _duration       = duration;
        _clickBlock     = [clickBlock copy];
        self.frame = CGRectMake(0, 0, _imageWidth, _imageHeight);
        
        /**避免可能出现数据量较大的图片占用内存*/
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
           [self downloadImageData:_imageUrls];
            dispatch_async(dispatch_get_main_queue(), ^{
                  [self settingUI];
            });
        });
    }
    return self;
}

- (instancetype)initWithLocalImageNames:(NSArray *)names viewFrame:(CGRect)frame duration:(NSTimeInterval)duration clickCompliment:(void (^)(NSInteger))clickBlock {
    if (self = [super init]) {
        _imageHeight    = frame.size.height;
        _imageWidth     = frame.size.width;
        _imageUrls      = names;
        _duration       = duration;
        _clickBlock     = [clickBlock copy];
        self.frame = CGRectMake(0, 0, _imageWidth, _imageHeight);
        
        /**避免堵塞组线程*/
        dispatch_async(dispatch_get_global_queue(0, 0), ^{
            [self loadLocalImagesWithNames:names];
            dispatch_async(dispatch_get_main_queue(), ^{
                [self settingUI];
            });
        });
    }
    return self;
}

#pragma mark 配置显示界面
- (void)settingUI {
    [self configScrollView];
    [self configImageViews];
    [self configDefaultImages];
    [self configPaggeControl];
    [self startTimerScrollView];
    [self addTapEventForScrollView];
}

- (void)configScrollView {
    _scrollView = [[UIScrollView alloc]initWithFrame:self.frame];
    _scrollView.bounces = NO;
    _scrollView.contentSize = CGSizeMake(_imageWidth*3.0, _imageHeight);
    _scrollView.contentOffset = CGPointMake(_imageWidth,0);
    _scrollView.showsHorizontalScrollIndicator = NO;
    _scrollView.pagingEnabled = YES;
    _scrollView.userInteractionEnabled = YES;
    [self addSubview:_scrollView];
}

- (void)configImageViews {
    /**设置  左,中,右 三张图片容器*/
    _leftImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, _imageWidth, _imageHeight)];
    _leftImageView.contentMode = UIViewContentModeScaleToFill;
    _centerImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_imageWidth, 0, _imageWidth, _imageHeight)];
    _centerImageView.contentMode = UIViewContentModeScaleToFill;
    _rightImageView = [[UIImageView alloc]initWithFrame:CGRectMake(_imageWidth*2.0, 0, _imageWidth, _imageHeight)];
    _rightImageView.contentMode = UIViewContentModeScaleToFill;
 
    [_scrollView addSubview:_leftImageView];
    [_scrollView addSubview:_centerImageView];
    [_scrollView addSubview:_rightImageView];
}

- (void)configPaggeControl {
    /** 创建->设置frame－>设置page指示器->添加到父视图*/
    _pageViewControl = [UIPageControl new];
    CGSize  pageViewSize   = [_pageViewControl sizeForNumberOfPages:_images.count];
    CGPoint pageViewCenter =  CGPointMake(_imageWidth*0.5, _imageHeight - pageViewSize.height* 0.5);
    _pageViewControl.bounds = CGRectMake(0, 0, pageViewSize.width, pageViewSize.height);
    _pageViewControl.center = pageViewCenter;
    _pageViewControl.currentPageIndicatorTintColor=[UIColor blueColor];
    _pageViewControl.pageIndicatorTintColor = [UIColor grayColor];
    _pageViewControl.numberOfPages = _images.count;
    _pageViewControl.currentPage =  0;
    [self addSubview:_pageViewControl];
}

- (void)configDefaultImages {
    /**一般banner条较小,直接缓存在内存中,如果图片较大,可改从本地文件缓存读取*/
    _leftImageView.image   = _images.lastObject;
    _centerImageView.image = _images[0];
    _rightImageView.image  = _images[1];
}

#pragma mark 拖拽滚动事件 ==== scrollView delegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
   //停止计时器
    [self stopTimerScrollView];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate {
   //启动计时器
     [self startTimerScrollView];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    //重新加载图片
    [self updateDefaultImage];
    [_scrollView setContentOffset:CGPointMake(_imageWidth, 0) animated:YES];
    _pageViewControl.currentPage = _currentImageIndex;
}

#pragma mark 计时器滚动事件
- (void)startTimerScrollView {
    if (_timer == nil) {
        _timer =
        [NSTimer timerWithTimeInterval:_duration target:self selector:@selector(showNextImage) userInfo:nil repeats:YES];
    /**注意:如果在添加的视图中有多个滚动视图,必须将其滚动事件添加到MainRunLoop保持同步*/
    [[NSRunLoop mainRunLoop]addTimer:_timer forMode:NSRunLoopCommonModes];
    }
}

- (void)stopTimerScrollView {
    [_timer invalidate];
    _timer = nil;
}

#pragma mark 添加点击事件
- (void)addTapEventForScrollView {
    UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(handlTapEvent)];
    tap.numberOfTapsRequired = 1;
    [self addGestureRecognizer:tap];
}
- (void)handlTapEvent {
    _clickBlock(_currentImageIndex);
}

#pragma mark 获取图片数据
/**显示下一张图片,实现逻辑变成与滚动图片相似,将其offset移动一位*/
- (void)showNextImage {
   __block NSInteger _leftImageIndex,_rightImageIndex;
    CGPoint offsert = _scrollView.contentOffset;
    _currentImageIndex = (_currentImageIndex + 1)%_images.count;
    _rightImageIndex   = (_currentImageIndex + 1)%_images.count;
    _leftImageIndex    = (_currentImageIndex + _images.count - 1)%_images.count;
    offsert = CGPointMake(offsert.x + _imageWidth, 0);
    [UIView animateWithDuration:0.5 animations:^{
        _scrollView.contentOffset = offsert;
    } completion:^(BOOL finished){
        _leftImageView.image   = _images[_leftImageIndex];
        _centerImageView.image = _images[_currentImageIndex];
        _rightImageView.image  = _images[_rightImageIndex];
        _scrollView.contentOffset = CGPointMake(_imageWidth, 0);
        _pageViewControl.currentPage = _currentImageIndex;
    }];
    
}

/**重新载入图片*/
- (void)updateDefaultImage {
    /**移动动后位置*/
    NSInteger leftImageIndex,rightImageIndex;
    CGFloat currentOffsetX = [_scrollView contentOffset].x;
    if (currentOffsetX > _imageWidth) {
        //向右边移动 ++
        _currentImageIndex = (_currentImageIndex + 1)%_images.count;
    }
    else if(currentOffsetX < _imageWidth){
        //向左边移动 --
        _currentImageIndex = (_currentImageIndex + _images.count - 1)%_images.count;
    }
    /**重设图片*/
    leftImageIndex  =  (_currentImageIndex + _images.count - 1)%_images.count;
    rightImageIndex =  (_currentImageIndex + 1)%_images.count;
    _leftImageView.image   = _images[leftImageIndex];
    _centerImageView.image = _images[_currentImageIndex];
    _rightImageView.image  = _images[rightImageIndex];
}

/**从网络下载图片*/
- (void)downloadImageData:(NSArray*)imageUrls {
    //定义图片缓存数组 和图片缓存路径
    NSMutableArray* mutableImageArray = [NSMutableArray array];
    NSString* cahesPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) firstObject];
    NSFileManager* fileManger = [NSFileManager defaultManager];

    //遍历图片路径获取图片
    for (NSInteger index = 0; index < imageUrls.count; index++) {
        //获取每张图片的网址和文件路径
        NSURL* imageUrl = [NSURL URLWithString:imageUrls[index]];
        NSString* imageFilePath = [cahesPath stringByAppendingPathComponent:imageUrl.absoluteString.lastPathComponent];
        if ([fileManger fileExistsAtPath:imageFilePath] == YES) {
            //如果存在图片,从本地加载图片
            NSData* dataImage = [NSData dataWithContentsOfFile:imageFilePath];
            UIImage* image    = [UIImage imageWithData:dataImage];
            [mutableImageArray addObject:image];
        }
        else{
            //如果不存在则从网络加载图片
            NSData* imageData = [NSData dataWithContentsOfURL:imageUrl];
            UIImage* image    = [UIImage imageWithData:imageData];
            [mutableImageArray addObject:image];
            //并将下载的图片保存到本地缓存
            [imageData writeToFile:imageFilePath atomically:NO];
        }
    }
    _images = [mutableImageArray copy];
}

/**从本地图片加载*/
- (void)loadLocalImagesWithNames:(NSArray* )names {
    NSMutableArray* mutableImageArray = [NSMutableArray array];
    for (NSInteger index = 0; index < names.count;index++) {
        UIImage* image = [UIImage imageNamed:names[index]];
        [mutableImageArray addObject:image];
    }
    _images = [mutableImageArray copy];
}

@end
