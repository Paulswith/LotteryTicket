//
//  LTLotteryHallTableViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/30.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何延迟调用方法

#import "LTLotteryHallTableViewController.h"
#import "LTCover.h"
#import "LTImageOnCover.h"

@interface LTLotteryHallTableViewController ()<imageViewOnCoverDelegate>

@end

@implementation LTLotteryHallTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImage *leftImage = [UIImage imageNamed:@"CS50_activity_image"];
    leftImage = [leftImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]; //去除默认渲染模式
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:leftImage
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(onTapLeft:)];
}

#pragma mark - onTapLeft:
- (void)onTapLeft:(UIBarButtonItem *)barButton {
    [LTCover show];
    LTImageOnCover *imageOncover = [LTImageOnCover showImageInWindow];
    imageOncover.delegate = self;
}

#pragma mark - imageViewOnCoverDelegate
- (void)imageViewOnCoverTapAction:(LTImageOnCover *)imageOnCover {
    [imageOnCover removeImageFromCoverAndFinishedDo:^{
        [LTCover removeCover];
    }];
    //    CZ_PerformSelectorAfterDelay(self, @selector(removeCover), nil, 0.7);   //曾使用延迟的方法实现
}

@end
