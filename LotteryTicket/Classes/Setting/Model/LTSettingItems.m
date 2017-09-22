//
//  LTSettingItems.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/15.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTSettingItems.h"



@implementation LTSettingItems
+ (instancetype)settingItemsWithIcon:(NSString *)iconName cellName:(NSString *)cellName withCellType:(LTCellType)cellType cellDetail:(NSString *)detail completePerform:(selectPreform)Perform{
    LTSettingItems *item = [[LTSettingItems alloc] init];
    item.icon= [UIImage imageNamed:iconName];
    item.celleName = cellName;
    item.cellType = cellType;
    item.performWhenSelect = Perform;
    item.cellDetail = detail;
    return item;
}

@end
