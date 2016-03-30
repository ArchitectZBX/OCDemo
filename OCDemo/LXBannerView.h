//
//  LXBannerScrollView.h
//  banner
//
//  Created by guolongxiang on 16/3/26.
//  Copyright © 2016年 guolongxiang. All rights reserved.
//

#import <UIKit/UIKit.h>
@interface BannerScroll:UIScrollView

@end

@interface LXBannerView : UIView

/**
 * @description      调用此方法加载图片地址创建图片录播器。
 * @param urls       网络图片地址数组
 * @param frame      View的frame
 * @param duration   图片轮播的时间
 * @param clickBlock 图片点击之后的回调方法
 */

- (instancetype)initWithNetWorkImageUrls:(NSArray* )urls viewFrame:(CGRect)frame duration:(NSTimeInterval)duration clickCompliment:(void(^)(NSInteger index))clickBlock;

/**
 * @description      调用此方法加载根据图片名字创建图片轮播器
 * @param urls       网络图片地址数组
 * @param frame      View的frame
 * @param duration   图片轮播的时间
 * @param clickBlock 图片点击之后的回调方法
 */
- (instancetype)initWithLocalImageNames:(NSArray* )names viewFrame:(CGRect)frame duration:(NSTimeInterval)duration clickCompliment:(void(^)(NSInteger index))clickBlock;


@end
