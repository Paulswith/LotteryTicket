//
//  LTCollectionViewCell.h
//  LotteryTicket
//
//  Created by Dobby on 2017/9/14.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LTCollectionViewCell : UICollectionViewCell

/** 背景图 */
@property (nonatomic,strong) UIImage *bgImage;

- (void)setJumpbutttonIndex:(NSInteger)index count:(NSInteger)count;

@end
