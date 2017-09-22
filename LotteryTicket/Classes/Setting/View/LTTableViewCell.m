//
//  LTTableViewCell.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/15.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTTableViewCell.h"
#import "LTSettingItems.h"

@implementation LTTableViewCell

- (void)setCellItems:(LTSettingItems *)cellItems {
    _cellItems = cellItems;
    self.imageView.image = cellItems.icon;
    self.textLabel.text = cellItems.celleName;
    self.detailTextLabel.text = cellItems.cellDetail;
    //cell样式,根据按钮
    if (cellItems.cellType == LTCellDefault) {
        UIButton *cellBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"arrow_right"];
        [cellBtn setImage:image forState:UIControlStateNormal];
        [cellBtn sizeToFit];
        self.accessoryView = cellBtn;
    } else if (cellItems.cellType == LTCellSwitch) {
        self.accessoryView = [[UISwitch alloc] init];
    } else {
        UIButton *cellBtn =  [UIButton buttonWithType:UIButtonTypeCustom];
        UIImage *image = [UIImage imageNamed:@"tick"];
        [cellBtn setImage:image forState:UIControlStateNormal];
        [cellBtn sizeToFit];
        self.accessoryView = cellBtn;
        self.accessoryView.hidden = YES;
    }
}



@end
