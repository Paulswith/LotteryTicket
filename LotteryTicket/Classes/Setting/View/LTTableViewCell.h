//
//  LTTableViewCell.h
//  LotteryTicket
//
//  Created by Dobby on 2017/9/15.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTSettingItems;
@interface LTTableViewCell : UITableViewCell

@property(strong,nonatomic) LTSettingItems *cellItems; //cell属性设置

@end
