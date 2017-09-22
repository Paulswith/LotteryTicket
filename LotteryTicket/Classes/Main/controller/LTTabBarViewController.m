//
//  LTTabBarViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/30.
//  Copyright © 2017年 Dobby. All rights reserved.
//  用一种思路,替换TabBar
//  如何从storyBoard加载控制器

#import "LTTabBarViewController.h"
#import "LTLotteryHallTableViewController.h"
#import "LTArenaViewController.h"
#import "LTDiscoveryTableViewController.h"
#import "LTHistoryViewController.h"
#import "LTMyLotteryViewController.h"
#import "LTNewTabBarView.h"
#import "LTLotteryNavigationController.h"
#import "LTArenaNavigationController.h"

@interface LTTabBarViewController ()<LTNewTabBarViewDelegate>

@property(strong,nonatomic)NSMutableArray *imageGroups;

@end

@implementation LTTabBarViewController
- (NSMutableArray *)imageGroups {
    if (!_imageGroups) {
        _imageGroups = [NSMutableArray array];
    }
    return _imageGroups;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupSubItem];
    [self setupNewTabBar];

}

/*
 这里特殊操作,让tabar在其他页面都隐藏,将newTabView设置到tabbar上
 在即将显示的时候, 移除tabbar上的子控件
 */
- (void)setupNewTabBar {
    LTNewTabBarView *newTabBarView = [[LTNewTabBarView alloc] init];
    newTabBarView.frame = self.tabBar.bounds;   //bounds 与 frame有差别,
    [self.tabBar addSubview:newTabBarView];         //添加到tabBar上
    newTabBarView.imageArray = self.imageGroups;
    newTabBarView.delegate = self;
}

- (void)viewWillAppear:(BOOL)animated {         //然后在这里移除, 除了LTNewTabBarView 其他都移除
    [super viewWillAppear:animated];
    for (UIView *view in self.tabBar.subviews) {
        if (![view isKindOfClass:[LTNewTabBarView class]]) {
            [view removeFromSuperview];
        }
    }
}

//添加子Item
- (void)setupSubItem {
    [self addChildViewController:[self addViewControllerWith:[[LTLotteryHallTableViewController alloc] init]
                                               andSelectedImageName:@"TabBar_LotteryHall_selected_new"
                                             andImageName:@"TabBar_LotteryHall_new" andTitle:@"购彩大厅"]];
    [self addChildViewController:[self addViewControllerWith:[[LTArenaViewController alloc] init]
                                                andSelectedImageName:@"TabBar_Arena_selected_new"
                                              andImageName:@"TabBar_Arena_new" andTitle:@""]];
    //因为发现页是从storyBoard加载的
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:NSStringFromClass([LTDiscoveryTableViewController class]) bundle:nil];
    LTDiscoveryTableViewController *discoveryController = [storyBoard instantiateInitialViewController];
    [self addChildViewController:[self addViewControllerWith:discoveryController
                                                andSelectedImageName:@"TabBar_Discovery_selected_new"
                                              andImageName:@"TabBar_Discovery_new" andTitle:@"发现"]];
    [self addChildViewController:[self addViewControllerWith:[[LTHistoryViewController alloc] init]
                                                andSelectedImageName:@"TabBar_History_selected_new"
                                              andImageName:@"TabBar_History_new" andTitle:@"开奖信息"]];
    [self addChildViewController:[self addViewControllerWith:[[LTMyLotteryViewController alloc] init]
                                                andSelectedImageName:@"TabBar_MyLottery_selected_new"
                                              andImageName:@"TabBar_MyLottery_new" andTitle:@"我的彩票"]];
}


- (UIViewController *)addViewControllerWith:(UIViewController *)controller andSelectedImageName:(NSString *)SLImageName andImageName:(NSString *)imageName andTitle:(NSString *)title{
    UINavigationController *navigationController = [[UINavigationController alloc] init];
    if ([controller isKindOfClass:[LTArenaViewController class]]) {                                         //竞技场从StoryBoard加载
        navigationController =  [[LTArenaNavigationController alloc] initWithRootViewController:controller];
    }else{
        navigationController =  [[LTLotteryNavigationController alloc] initWithRootViewController:controller];
    }
    controller.navigationItem.title = title;
    controller.tabBarItem.image = [UIImage imageNamed:imageName];
    controller.tabBarItem.selectedImage = [UIImage imageNamed:SLImageName];
    [self.imageGroups addObject:controller.tabBarItem];
    return navigationController;
};
#pragma mark - LTNewTabBarViewDelegate
- (void)newTabBarView:(LTNewTabBarView *)newTabBarView andTapTag:(NSInteger)tag {
    self.selectedIndex = tag;
}







@end
