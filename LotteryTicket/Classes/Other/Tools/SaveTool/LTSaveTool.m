//
//  LTSaveTool.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/14.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何健康的使用第三方库,所有工具都变成自己入口封装,方便替换

#import "LTSaveTool.h"

@implementation LTSaveTool

// 封装一个常用的工具类
+ (void)setObject:(id)value forKey:(NSString *)defaultName autoSynchronize:(BOOL)synchronize {
    if (defaultName == nil) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setObject:value forKey:defaultName];
    if (synchronize) {
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
}

+ (id)objectForKey:(NSString *)defaultName {
    return [[NSUserDefaults standardUserDefaults] objectForKey:defaultName];
}

@end
