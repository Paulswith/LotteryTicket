//
//  LTBaseTableViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/15.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何一套继承tableView, 封装.子类只要提供数据源就可以了

#import "LTBaseTableViewController.h"
#import "LTSettingItems.h"
#import "LTTableViewCell.h"

@interface LTBaseTableViewController ()


@property(strong,nonatomic) NSMutableArray *saveItemArray; //保存模型的数组

@end

@implementation LTBaseTableViewController

- (instancetype)init {
    // 使用组table
    return [super initWithStyle:UITableViewStyleGrouped];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.tableFooterView = [UIView new]; //设置显示的FooterView的高度,步骤1
}
#pragma mark - lazyLoad
- (NSMutableArray *)saveItemArray {
    if (!_saveItemArray) {
        _saveItemArray = [NSMutableArray array];
    }
    return _saveItemArray;
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.saveItemArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    NSArray *first =  self.saveItemArray[section];
    return first.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    //缓存索取
    static  NSString *identifier = @"LT_cell";
    LTTableViewCell *cell =  [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[LTTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    NSArray *indexItemArray =  self.saveItemArray[indexPath.section];
    LTSettingItems *item = indexItemArray[indexPath.row];
    cell.cellItems = item;
    return cell;
}

#pragma mark - tableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *indexItemArray =  self.saveItemArray[indexPath.section];
    LTSettingItems *item = indexItemArray[indexPath.row];
    [tableView deselectRowAtIndexPath:indexPath animated:YES]; // 点击后取消选中状态
    if (item.performWhenSelect) {
        item.performWhenSelect();  //执行block
    }
    
}
//设置显示的FooterView的高度,步骤1
-(CGFloat)tableView:(UITableView*)tableView heightForHeaderInSection:(NSInteger)section
{
    return 10.f;
}

-(CGFloat)tableView:(UITableView*)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.01f;
}

@end
