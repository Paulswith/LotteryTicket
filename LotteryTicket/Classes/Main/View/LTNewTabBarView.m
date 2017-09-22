//
//  LTNewTabBarView.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/30.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTNewTabBarView.h"
#import "LTButton.h"

@interface LTNewTabBarView()
@property(weak,nonatomic)UIButton *selectedBtn;
@end

@implementation LTNewTabBarView

- (void)setImageArray:(NSArray *)imageArray {
    _imageArray = imageArray;
    for (int i=0; i < self.imageArray.count; i++) {
        UITabBarItem *tabBarItem = [imageArray objectAtIndex:i];
        UIButton *btn = [[LTButton alloc] init];
        btn.tag = i; //设置跳转标识符,代理的时候调用
        [btn addTarget:self action:@selector(tapTabBar:) forControlEvents:UIControlEventTouchDown];
        [btn setBackgroundImage:tabBarItem.image forState:UIControlStateNormal];
        [btn setBackgroundImage:tabBarItem.selectedImage forState:UIControlStateSelected];
        [self addSubview:btn];
    }
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat btnWidth = [UIScreen mainScreen].bounds.size.width /self.imageArray.count;
    int i = 0;
    for (UIButton *btn in self.subviews) {
        CGFloat eachBtnX = i * btnWidth;
        i++;
        btn.frame = CGRectMake(eachBtnX, 0, btnWidth, self.frame.size.height);
    }
}

- (void)tapTabBar:(UIButton *)btn {
    self.selectedBtn.selected = NO;  //取消之前的selected 状态
    btn.selected = YES;              //设置当前高亮
    self.selectedBtn = btn;          //指向当前
    if ([self.delegate respondsToSelector:@selector(newTabBarView:andTapTag:)]) {
        [self.delegate newTabBarView:self andTapTag:btn.tag];
    }
}
@end
