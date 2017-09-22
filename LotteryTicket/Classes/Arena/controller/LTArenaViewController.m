//
//  LTArenaViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/30.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTArenaViewController.h"

@interface LTArenaViewController ()

@end

@implementation LTArenaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIImageView *arenaImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    arenaImageView.image = [UIImage imageNamed:@"NLArenaBackground"];
    [self.view addSubview:arenaImageView];
    
    UISegmentedControl *segmentedController = [[UISegmentedControl alloc] initWithItems:@[@"足球",@"篮球"]];
    [segmentedController setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentBG"]
                                   forState:UIControlStateNormal
                                 barMetrics:UIBarMetricsDefault];
    [segmentedController setBackgroundImage:[UIImage imageNamed:@"CPArenaSegmentSelectedBG"]
                                   forState:UIControlStateSelected
                                 barMetrics:UIBarMetricsDefault];
    [segmentedController setTintColor:[UIColor colorWithRed:0 green:143/255.0 blue:142/255.0 alpha:1]];   //设置与背景选中状态同色
    [segmentedController setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}
                                       forState:UIControlStateNormal];
    [segmentedController setSelectedSegmentIndex:0]; //默认选中状态
    self.navigationItem.titleView = segmentedController;
}



@end
