//
//  LTSettingViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/20.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTSettingViewController.h"
#import "LTSettingItems.h"
#import "LTTableViewCell.h"
#import "LTPushAndRemindViewController.h"
#import "LTUseCaseCodeViewController.h"


@interface LTSettingViewController ()

@property(strong,nonatomic) NSMutableArray *saveItemArray; //保存模型的数组
@end


@implementation LTSettingViewController
/*
 1 这里继承自父类BaseTBV
 2 只需要设置模型就可以
 3 设置一个可变数组(懒加载下), 生成模型,并存储

 */
- (NSMutableArray *)saveItemArray {
    if (!_saveItemArray) {
        _saveItemArray = [NSMutableArray array];
    }
    return _saveItemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpItem];
}

- (void)setUpItem {
    __weak typeof(self) weakself = self;
    LTSettingItems *item1 = [LTSettingItems settingItemsWithIcon:@"RedeemCode"
                                                        cellName:@"使用注册码"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{
        LTUseCaseCodeViewController *useCaseCodeViewController = [[LTUseCaseCodeViewController alloc] init];
        [weakself.navigationController pushViewController:useCaseCodeViewController animated:YES];
    }];
    [self.saveItemArray addObject:@[item1]];
    
    LTSettingItems *item2 = [LTSettingItems settingItemsWithIcon:@"MorePush"
                                                        cellName:@"推送和提醒"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{
        LTPushAndRemindViewController *viewCV = [[LTPushAndRemindViewController alloc] init];
        viewCV.title = @"推送与提醒";
        [weakself.navigationController pushViewController:viewCV animated:YES];
    }];
    LTSettingItems *item3 = [LTSettingItems settingItemsWithIcon:@"more_homeshake"
                                                        cellName:@"摇一摇机选"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:nil
                                                 completePerform:nil];
    LTSettingItems *item4 = [LTSettingItems settingItemsWithIcon:@"sound_Effect"
                                                        cellName:@"声音效果"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:nil
                                                 completePerform:nil];
    LTSettingItems *item5 = [LTSettingItems settingItemsWithIcon:@"RedeemCode"
                                                        cellName:@"圈子仅WIFI加载图片"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:nil
                                                 completePerform:nil];
    [self.saveItemArray addObject:@[item2,item3,item4,item5]];
    
    LTSettingItems *item6 = [LTSettingItems settingItemsWithIcon:@"MoreShare"
                                                        cellName:@"推荐给朋友"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil completePerform:^{}];
    LTSettingItems *item7 = [LTSettingItems settingItemsWithIcon:@"MoreNetease"
                                                        cellName:@"产品推荐"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{}];
    LTSettingItems *item8 = [LTSettingItems settingItemsWithIcon:@"MoreMessage"
                                                        cellName:@"服务协议"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{}];
    LTSettingItems *item9 = [LTSettingItems settingItemsWithIcon:@"MoreAbout"
                                                        cellName:@"关于"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{}];
    [self.saveItemArray addObject:@[item6,item7,item8,item9]];
}

@end
