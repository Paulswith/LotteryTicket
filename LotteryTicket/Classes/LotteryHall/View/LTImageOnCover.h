//
//  LTImageOnCover.h
//  LotteryTicket
//
//  Created by Dobby on 2017/9/1.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import <UIKit/UIKit.h>

@class LTImageOnCover;
@protocol imageViewOnCoverDelegate <NSObject>

- (void)imageViewOnCoverTapAction:(LTImageOnCover *)imageOnCover;

@end

@interface LTImageOnCover : UIView
@property(strong,nonatomic)id<imageViewOnCoverDelegate> delegate; 

+ (instancetype)showImageInWindow;
- (void)removeImageFromCoverAndFinishedDo:(void(^)())completion;

@end
