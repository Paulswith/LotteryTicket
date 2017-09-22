//
//  LTNewTabBarView.h
//  LotteryTicket
//
//  Created by Dobby on 2017/8/30.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import <UIKit/UIKit.h>


@class LTNewTabBarView;
@protocol LTNewTabBarViewDelegate <NSObject>

- (void)newTabBarView:(LTNewTabBarView *)newTabBarView andTapTag:(NSInteger)tag;

@end
@interface LTNewTabBarView : UIView
@property(strong,nonatomic)NSArray *imageArray; //
@property(strong,nonatomic)id<LTNewTabBarViewDelegate> delegate; //
@end
