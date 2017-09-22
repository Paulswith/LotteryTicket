//
//  LTImageView.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/31.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何使用block执行

#import "LTImageOnCover.h"


@implementation LTImageOnCover

+ (instancetype)showImageInWindow {
    UIView *xibImageView = [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([LTImageOnCover class])
                                                          owner:nil
                                                        options:nil] firstObject];
    xibImageView.center = LT_KEYWINDOW.center;
    //    imageView.leftLuckyView.layer.masksToBounds = YES; //  超出父控件剪切 clipbounds = YES ;也是可以的
    [LT_KEYWINDOW addSubview:xibImageView];
    return (LTImageOnCover *)xibImageView;  //把自己传出去,便于外界设置代理
}

//关闭点击事件
- (IBAction)close:(UIButton *)sender {
    if ([self.delegate respondsToSelector:@selector(imageViewOnCoverTapAction:)]) {
        [self.delegate imageViewOnCoverTapAction:self];
    }
}

//移除
- (void)removeImageFromCoverAndFinishedDo:(void(^)())completion {
    [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionLayoutSubviews animations:^{
        self.center = CGPointMake(44, 44);
        self.transform = CGAffineTransformMakeScale(0.1, 0.1);
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
        if (completion) {
            completion();
        }
    }];
}

@end
