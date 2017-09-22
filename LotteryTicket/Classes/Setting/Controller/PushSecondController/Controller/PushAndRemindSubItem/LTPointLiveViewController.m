//
//  LTPointLiveViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/21.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何隐藏CELL

#import "LTPointLiveViewController.h"
#import "LTSettingItems.h"
#import "LTTableViewCell.h"

@interface LTPointLiveViewController ()

@property(strong,nonatomic) NSMutableArray *saveItemArray; //
@property(assign,nonatomic) CGFloat originalCellHeight; //原始高度
@property(assign,nonatomic) BOOL isHiddenItem; //隐藏cell
@property(strong,nonatomic) LTTableViewCell *cell; //
@end

@implementation LTPointLiveViewController
- (NSMutableArray *)saveItemArray {
    if (!_saveItemArray) {
        _saveItemArray = [NSMutableArray array];
    }
    return _saveItemArray;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.originalCellHeight = self.tableView.rowHeight;
    NSLog(@"originalCellHeight : %f",self.originalCellHeight);
    [self setupItems];
}

- (void)setupItems {
    LTSettingItems *item1 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"24小时推送"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:nil
                                                completePerform:nil];
    LTSettingItems *item2 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"自定义推送时间段"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:nil
                                                 completePerform:nil];
    [self.saveItemArray addObject:@[item1,item2]];
    LTSettingItems *item3 = [LTSettingItems settingItemsWithIcon:nil
                                                        cellName:@"进球音效"
                                                    withCellType:LTCellSwitch
                                                      cellDetail:nil
                                                 completePerform:nil];
    [self.saveItemArray addObject:@[item3]];
}

#pragma makr ---------------------
#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    // 把要隐藏的item的高度设置为0
    if (indexPath.section == 1 && self.isHiddenItem) {
        return 0;
    }
    return 45;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [super tableView:tableView didSelectRowAtIndexPath:indexPath];
    if (indexPath.section == 0 && indexPath.row == 0) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:1];
        self.isHiddenItem = YES;
        
        [UIView animateWithDuration:0.3 animations:^{
            [self.tableView cellForRowAtIndexPath:index].alpha = 0.0f;
        } completion:^(BOOL finished) {
            // 隐藏的对应item
            [[self.tableView cellForRowAtIndexPath:index] setHidden:YES];
            // 刷新被隐藏的item
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationTop];
        }];
    }else if (indexPath.section == 0 && indexPath.row == 1) {
        NSIndexPath *index = [NSIndexPath indexPathForRow:0 inSection:1];
        self.isHiddenItem = NO;
        [UIView animateWithDuration:0.3 animations:^{
            [self.tableView cellForRowAtIndexPath:index].alpha = 1.0f;
        } completion:^(BOOL finished) {
            // 隐藏的对应item
            [[self.tableView cellForRowAtIndexPath:index] setHidden:NO];
            // 刷新被隐藏的item
            [self.tableView reloadRowsAtIndexPaths:[NSArray arrayWithObject:index] withRowAnimation:UITableViewRowAnimationTop];
        }];
    }
}


@end
