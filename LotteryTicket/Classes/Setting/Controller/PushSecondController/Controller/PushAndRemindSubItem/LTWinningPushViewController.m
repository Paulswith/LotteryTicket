//
//  LTWinningPushViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/21.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTWinningPushViewController.h"
#import "LTSettingItems.h"
#import "LTTableViewCell.h"

@interface LTWinningPushViewController ()

@property(strong,nonatomic) NSMutableArray *saveItemArray; //保存模型的数组
@property(strong,nonatomic) LTTableViewCell *cell; //记录状态的CELL

@end

@implementation LTWinningPushViewController

- (NSMutableArray *)saveItemArray {
    if (!_saveItemArray) {
        _saveItemArray = [NSMutableArray array];
    }
    return _saveItemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupItems];
}

- (void)setupItems {
    LTSettingItems *item1 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"中奖推送"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:nil
                                                 completePerform:nil];
    [self.saveItemArray addObject:@[item1]];
    LTSettingItems *item2 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"全部彩种"
                                                    withCellType:LTCellTick
                                                      cellDetail:nil
                                                 completePerform:nil];
    LTSettingItems *item3 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"高频彩以外的彩种"
                                                    withCellType:LTCellTick
                                                      cellDetail:nil
                                                 completePerform:nil];
    [self.saveItemArray addObject:@[item2,item3]];
}
#pragma makr ---------------------
#pragma mark - tableviewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (section == 1) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"   包括:";
        return label;
    }
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return section == 1 ? 40.0 : 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    if (section == 0) {
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.textColor = [UIColor brownColor];
        label.text = @"   开启后,当有新中奖订单,您会收到炸弹.";
        return label;
    }
    return [UIView new];
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return section == 0 ? 40.0 : 10;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //切换打钩逻辑
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    if (indexPath.section == 1) {
        self.cell.accessoryView.hidden = YES;
        self.cell = [tableView cellForRowAtIndexPath:indexPath];
        self.cell.accessoryView.hidden = NO;
    }
}



@end
