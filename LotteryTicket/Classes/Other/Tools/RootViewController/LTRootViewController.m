//
//  LTRootViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/14.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何封装版本更新时候的,根据版本提示欢迎动画

#import "LTRootViewController.h"
#import "LTTabBarViewController.h"
#import "LTCollectionViewController.h"

#define LT_VERSION @"version"
@implementation LTRootViewController

+ (UIViewController *)keyRootViewController {
    UIViewController *tabbarViewController;
    NSString *currentVesion = [NSBundle mainBundle].infoDictionary[@"CFBundleShortVersionString"];
    NSString *lastVersion = [LTSaveTool objectForKey:LT_VERSION];
//    NSLog(@"lastVersion:%@",lastVersion);
    if (![currentVesion isEqualToString:lastVersion]) {
        tabbarViewController = [[LTCollectionViewController alloc] init];
        //存储版本信息, 作为每次进入的比对
        [LTSaveTool setObject:currentVesion forKey:LT_VERSION autoSynchronize:YES];
    }else {
        tabbarViewController = [[LTTabBarViewController alloc] init];
    }
    return tabbarViewController;
}

@end
