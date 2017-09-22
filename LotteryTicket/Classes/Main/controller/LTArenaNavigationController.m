//
//  LTArenaNavigationController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/4.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何拉伸突破2

#import "LTArenaNavigationController.h"

@interface LTArenaNavigationController ()

@end

@implementation LTArenaNavigationController

+ (void)initialize {
    UINavigationBar *arenaNavigationbar = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[self]];
    UIImage *image = [UIImage imageNamed:@"NLArenaNavBar64"];
    image = [image stretchableImageWithLeftCapWidth:image.size.width/2 topCapHeight:image.size.height/2];   //拉伸处理
    [arenaNavigationbar setBackgroundImage:image forBarMetrics:UIBarMetricsDefault];
}


@end
