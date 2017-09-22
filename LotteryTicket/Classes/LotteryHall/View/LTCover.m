//
//  LTCover.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/31.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTCover.h"


@implementation LTCover

+ (void)show {
    LTCover *cover = [[LTCover alloc] init];
    cover.frame = LT_KEYWINDOW.bounds;
    cover.backgroundColor = [UIColor blackColor];
    cover.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.7];
    [LT_KEYWINDOW addSubview:cover];
}

+ (void)removeCover {
    for (UIView *view in LT_KEYWINDOW.subviews) {
        if ([view isKindOfClass:[LTCover class]]) {
            NSLog(@"%s",__func__);
            [view removeFromSuperview];
            view.alpha = 0;
            break;
        }
    }
}

@end
