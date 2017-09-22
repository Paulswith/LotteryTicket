//
//  LTCollectionViewCell.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/14.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何健康的切换控制器, 更换rootController

#import "LTCollectionViewCell.h"
#import "LTTabBarViewController.h"

@interface LTCollectionViewCell()

/** 显示在contentView上的ImageView, 用来展示图片 */
@property (nonatomic,strong) UIImageView *imageView;  //是否可以改为weak
@property(strong,nonatomic) UIButton *preferBtn; //跳转到主页的按钮
@end

@implementation LTCollectionViewCell
#pragma mark - lazyLoad
- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
    }
    return _imageView;
}
- (UIButton *)preferBtn {
    if (!_preferBtn) {
        _preferBtn = [[UIButton  alloc] init];
        [_preferBtn setBackgroundImage:[UIImage imageNamed:@"guideStart"] forState:UIControlStateNormal];
        [_preferBtn sizeToFit];
        [self.contentView addSubview:_preferBtn];
        _preferBtn.center = CGPointMake(self.bounds.size.width / 2, self.bounds.size.height * 0.9f);
        [_preferBtn addTarget:self action:@selector(jumpToTabBar) forControlEvents:UIControlEventTouchDown];
    }
    return _preferBtn;
}

- (void)jumpToTabBar {
    NSLog(@"%s",__func__);
    //切换控制的方法, 可以销毁掉当前的keyWindow.rootViewController
    LTTabBarViewController *tabBarController = [[LTTabBarViewController alloc] init];
    [LT_KEYWINDOW.rootViewController presentViewController:tabBarController animated:YES completion:^{
        LT_KEYWINDOW.rootViewController = tabBarController;
    }];
}

#pragma mark - cellContent
- (void)setBgImage:(UIImage *)bgImage {
    _bgImage = bgImage;
    self.imageView.image = bgImage;
}

- (void)setJumpbutttonIndex:(NSInteger)index count:(NSInteger)count {
    if (index == count - 1 ) {
        //是最后一个,展示跳转按钮
        self.preferBtn.hidden = NO;
    }else {
        self.preferBtn.hidden = YES;
    }
}

@end
