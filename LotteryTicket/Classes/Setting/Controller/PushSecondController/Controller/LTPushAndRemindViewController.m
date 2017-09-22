//
//  LTPushAndRemindViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/20.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTPushAndRemindViewController.h"
#import "LTSettingItems.h"
#import "LTWinningPushViewController.h"
#import "LTOpenTicketPushViewController.h"
#import "LTPointLiveViewController.h"

@interface LTPushAndRemindViewController ()

@property(strong,nonatomic) NSMutableArray *saveItemArray; //保存模型的数组

@end

@implementation LTPushAndRemindViewController
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
    LTSettingItems *item1 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"中奖推送"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{
        LTWinningPushViewController *winningPushViewController  = [[LTWinningPushViewController alloc] init];
        winningPushViewController.title = @"中奖推送";
        [weakself.navigationController pushViewController:winningPushViewController animated:YES];
    }];
    LTSettingItems *item2 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"开奖推送"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{
         LTOpenTicketPushViewController *openTicketPushViewController = [[LTOpenTicketPushViewController alloc] init];
         openTicketPushViewController.title = @"开奖推送设置";
         [weakself.navigationController pushViewController:openTicketPushViewController animated:YES];
    }];
    LTSettingItems *item3 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"比分直播设置"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{
         LTPointLiveViewController *pointLiveViewController = [[LTPointLiveViewController alloc] init];
         pointLiveViewController.title = @"比分直播设置";
         [weakself.navigationController pushViewController:pointLiveViewController animated:YES];
    }];
    LTSettingItems *item4 = [LTSettingItems settingItemsWithIcon:nil cellName:@"中奖动画"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{
        
    }];
    LTSettingItems *item5 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"购彩提醒"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{
        
    }];
    LTSettingItems *item6 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"圈子推送"
                                                    withCellType:LTCellDefault
                                                      cellDetail:nil
                                                 completePerform:^{

    }];
    
    [self.saveItemArray addObject:@[item1,item2,item3,item4,item5,item6]];
}




@end
