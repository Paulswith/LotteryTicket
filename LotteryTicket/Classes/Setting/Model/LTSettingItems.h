//
//  LTSettingItems.h
//  LotteryTicket
//
//  Created by Dobby on 2017/9/15.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^selectPreform) ();
typedef NS_ENUM(NSInteger,LTCellType)
{
    LTCellDefault,
    LTCellSwitch,
    LTCellTick,
};

@interface LTSettingItems : NSObject

@property(strong,nonatomic) UIImage *icon;      //左图标
@property(strong,nonatomic) NSString *celleName; //cell名
@property(strong,nonatomic) NSString *cellDetail; //cell名
@property(assign,nonatomic) LTCellType cellType;     //是否开关按钮
@property(strong,nonatomic) selectPreform performWhenSelect; //点击时候调用的block

+ (instancetype)settingItemsWithIcon:(NSString *)iconName cellName:(NSString *)cellName withCellType:(LTCellType)cellType cellDetail:(NSString *)detail completePerform:(selectPreform)Perform;

@end
