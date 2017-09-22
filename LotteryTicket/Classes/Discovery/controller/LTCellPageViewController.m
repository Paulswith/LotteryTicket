//
//  LTCellPageViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/4.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTCellPageViewController.h"
#import "LTDiscoverPageButton.h"

@interface LTCellPageViewController ()

@end

@implementation LTCellPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    LTDiscoverPageButton *barBtn = [LTDiscoverPageButton buttonWithType:UIButtonTypeCustom];
    [barBtn buttonSetTitle:@"农场大全" WithImageName:@"YellowDownArrow" forState:UIControlStateNormal];  //自定义titleView头部
    self.navigationItem.titleView = barBtn;
}

@end
