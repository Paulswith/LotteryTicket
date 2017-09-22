//
//  LTLotteryNavigationController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/31.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何runtime实现全屏滑动退出
//  如何,统一实现全局返回按钮

#import "LTLotteryNavigationController.h"

@interface LTLotteryNavigationController ()<UIGestureRecognizerDelegate>
@property(assign,nonatomic) id backDelegate; // 保存代理

@end

@implementation LTLotteryNavigationController

+ (void)initialize {
//    NSLog(@"%s",__func__);
    // 获取栈顶控制 最酷的方法
    // mark - 该方法虽然是初次加载的时候调用, 但是如果存在缓存的话, 会调用多次
    if (self != [LTLotteryNavigationController class]) {
        return;
    }
    UINavigationBar *controller = [UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[LTLotteryNavigationController class]]];
    [controller setBackgroundImage:[UIImage imageNamed:@"toolbar_background"] forBarMetrics:UIBarMetricsDefault];
    NSMutableDictionary *textAttributesDict = [NSMutableDictionary dictionary];
    textAttributesDict[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    textAttributesDict[NSForegroundColorAttributeName] = [UIColor whiteColor];
    [controller setTitleTextAttributes:textAttributesDict];
    
    //统一设置返回按钮 将"返回"按钮偏移到-100处,只留下图标
    [controller setTintColor:[UIColor whiteColor]];
    UIBarButtonItem *backItem = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[LTLotteryNavigationController class]]]; //拿到栈顶的UIbar
    [backItem setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -100) forBarMetrics:UIBarMetricsDefault];
    [backItem setTintColor:[UIColor whiteColor]];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    NSLog(@"%@",self.interactivePopGestureRecognizer);
    /*
     通过此方法处理全屏返回
     1 通过代理方法拿到target,也是handleNavigationTransition:的处理对象UIGestureRecognizer
     2 获取系统handleNavigationTransition: 使用系统的来处理全屏滑动
     3 代理会把自己传过来~
     */
    id target = self.interactivePopGestureRecognizer.delegate;
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    [self.view addGestureRecognizer:pan];
    pan.delegate = self;
}

#pragma mark - UIGestureRecognizerDelegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    NSLog(@"%ld",self.self.viewControllers.count);
    return self.viewControllers.count > 1 ? YES : NO;  //栈顶之外的说明不是根控制器,允许滑动. else不允许滑动返回
}

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    //在push到非栈顶控制器,过去之前设置隐藏属性,以隐藏TABBAr
    if (self.viewControllers.count > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
    }
    [super pushViewController:viewController animated:animated];
}


@end
