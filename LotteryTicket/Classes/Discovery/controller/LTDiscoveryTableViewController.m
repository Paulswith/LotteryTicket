//
//  LTDiscoveryTableViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/30.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何做简单View入场动画

#import "LTDiscoveryTableViewController.h"
#import "LTCellPageViewController.h"

@interface LTDiscoveryTableViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *cellTitleImageview;
@property (weak, nonatomic) IBOutlet UIImageView *cellIconImageview;
@property (weak, nonatomic) IBOutlet UILabel *cellAdvText;

@end

@implementation LTDiscoveryTableViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.tableView reloadData];  //入场动画, 慎用大型tablview
}

#pragma mark - Table view data source
// 动画
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    cell.transform = CGAffineTransformMakeTranslation(-self.view.width, 0); //左移一个屏幕宽度
    [UIView animateWithDuration:0.5 animations:^{
        cell.transform = CGAffineTransformIdentity;    //复位动画
    }];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    LTCellPageViewController *cellPageViewController = [[LTCellPageViewController alloc] init];
    cellPageViewController.hidesBottomBarWhenPushed = YES;                   //Push到下层的时候,设置隐藏tabbar
    [self.navigationController pushViewController:cellPageViewController animated:YES];
}
@end
