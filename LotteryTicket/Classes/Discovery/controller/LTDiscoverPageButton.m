//
//  LTDiscoverPageButton.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/4.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何交换按钮和icon的位置

#import "LTDiscoverPageButton.h"

@implementation LTDiscoverPageButton

- (void)layoutSubviews {
    [super layoutSubviews];
    if (self.imageView.x < self.titleLabel.x) {
        self.titleLabel.x = self.imageView.x;   //Label先切换到最左边来,
        self.imageView.x = CGRectGetMaxX(self.titleLabel.frame);
    }//保证只调一次, 因为是存在多次调用的情况. 切换后imageviewX会大于label的,以此判断 
}
- (void)buttonSetTitle:(NSString *)title WithImageName:(NSString *)imageName forState:(UIControlState)state {
    [self setImage:[UIImage imageNamed:imageName] forState:state];
    [self setTitle:title forState:state];
    [self sizeToFit];
}
@end
