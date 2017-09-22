//
//  LTOpenTicketPushViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/21.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTOpenTicketPushViewController.h"
#import "LTSettingItems.h"

// 屏幕尺寸
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
@interface LTOpenTicketPushViewController ()

@property(strong,nonatomic) NSMutableArray *saveItemArray; //保存模型的数组

@end

@implementation LTOpenTicketPushViewController
- (NSMutableArray *)saveItemArray {
    if (!_saveItemArray) {
        _saveItemArray = [NSMutableArray array];
    }
    return _saveItemArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    //提示语逻辑~ 很乱烂糟
    self.tableView.contentInset = UIEdgeInsetsMake(40, 0, 0, 0);
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, -40, SCREEN_WIDTH - 20, 40)];
    view.backgroundColor = [UIColor colorWithRed:254 green:254 blue:252 alpha:1];
    UIImage *image = [UIImage imageNamed:@"lamp"];
    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    imageView.frame = CGRectMake(0, 0, image.width, image.height);
    
    UILabel *label = [[UILabel alloc] init];
    label.frame =CGRectMake(image.width + 5, 0 , view.width - image.width + 10, view.height);
    label.text = @"打开设置即可在开奖后立即收到推送信息 ,  获知开奖号码";
    label.numberOfLines = 0;
    [label sizeToFit];
    [view addSubview:imageView];
    [view addSubview:label];
    
    [self.view addSubview:view];
    [self setupItems];
}
- (void)setupItems {
    NSLog(@"%s",__func__);
    LTSettingItems *item1 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"双色球"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:@"每周二,四,日开奖"
                                                 completePerform:nil];
    LTSettingItems *item2 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"高频彩以外的彩种"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:@"每周一,三,六开奖"
                                                 completePerform:nil];
    LTSettingItems *item3 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"全部彩种"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:@"每天开奖,包括试机号提醒"
                                                 completePerform:nil];
    LTSettingItems *item4 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"全部彩种"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:@"每周一,三,五开奖"
                                                 completePerform:nil];
    LTSettingItems *item5 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"全部彩种"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:@"每周二,五,日开奖"
                                                 completePerform:nil];
    LTSettingItems *item6 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"高频彩以外的彩种"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:@"每天开奖"
                                                 completePerform:nil];
    LTSettingItems *item7 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"全部彩种"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:@"每天开奖"
                                                 completePerform:nil];
    [self.saveItemArray addObject:@[item1,item2,item3,item4,item5,item6,item7]];
}

@end
