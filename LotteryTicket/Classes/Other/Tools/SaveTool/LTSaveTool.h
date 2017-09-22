//
//  LTSaveTool.h
//  LotteryTicket
//
//  Created by Dobby on 2017/9/14.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LTSaveTool : NSObject

+ (nullable id)objectForKey:(NSString *_Nullable)defaultName;
+ (void)setObject:(nullable id)value forKey:(NSString *_Nullable)defaultName autoSynchronize:(BOOL)synchronize;

@end
