 //
//  LTMyLotteryViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/8/30.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何突破拉伸图片1

#import "LTMyLotteryViewController.h"
//#import "LTBaseTableViewController.h"
#import "LTSettingViewController.h"

@interface LTMyLotteryViewController ()

@end

@implementation LTMyLotteryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    //无图左按钮 way.1
    //带图做按钮 way.2
    UIButton *myLotteryNavLeftButton = [[UIButton alloc] init];
    [myLotteryNavLeftButton setImage:[UIImage imageNamed:@"FBMM_Barbutton"] forState:UIControlStateNormal];
    [myLotteryNavLeftButton setTitle:@"客服" forState:UIControlStateNormal];
    [myLotteryNavLeftButton sizeToFit];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:myLotteryNavLeftButton];
    // 右按钮
    UIImage *settingImage = [UIImage imageNamed:@"Mylottery_config"];
    settingImage = [settingImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:settingImage
                                                                              style:UIBarButtonItemStylePlain
                                                                             target:self
                                                                             action:@selector(myLotteryNavRightButton:)];
    [self setupLoginGuideView];
}

- (void)myLotteryNavRightButton:(UIBarButtonItem *)btn {
    [self.navigationController pushViewController:[LTSettingViewController new] animated:YES];
}

- (void)setupLoginGuideView {
    UIImage *image = [UIImage imageNamed:@"LoginScreen"];
    CGFloat guideViewX =  (self.view.width - image.width)/2;
    UIImageView *guideImageView = [[UIImageView alloc] initWithFrame:CGRectMake(guideViewX, 150, image.width, image.height)];
    guideImageView.image = image;
    [self.view addSubview:guideImageView];
    

    UIImage *btnImage =  [UIImage imageNamed:@"RedButton"];
    //拉伸逻辑处理
    UIEdgeInsets insets = UIEdgeInsetsMake(btnImage.height/2, btnImage.width/2, btnImage.height/2, btnImage.width/2);
    btnImage = [btnImage resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];
    image = [image resizableImageWithCapInsets:insets resizingMode:UIImageResizingModeStretch];

    UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    loginBtn.frame = CGRectMake(guideViewX, CGRectGetMaxY(guideImageView.frame) + 100, guideImageView.width, 30);
    [loginBtn setBackgroundImage:btnImage forState:UIControlStateNormal];
    [loginBtn setBackgroundImage:[UIImage imageNamed:@"RedButtonPressed"] forState:UIControlStateHighlighted];
    [loginBtn setTitle:@"登录" forState:UIControlStateNormal];
    [self.view addSubview:loginBtn];
}

@end
