//
//  LTHelpViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/21.
//  Copyright © 2017年 Dobby. All rights reserved.
//

#import "LTHelpViewController.h"

#define LT_ScreenCenter [UIApplication sharedApplication].keyWindow.center
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@implementation LTHelpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, SCREEN_WIDTH - 30, 200)];
    NSString *str = @"新制齐纨素，皎洁如霜雪。\n裁作合欢扇，团圆似明月。\n出入君怀袖，动摇微风发。\n常恐秋节至，凉意夺炎热。\n弃捐箧奁中，恩情中道绝。";
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0f] range:NSMakeRange(0, str.length)];
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor brownColor] range:NSMakeRange(0, str.length)];
    label.numberOfLines = 0;
    label.attributedText = attrStr;
    [label sizeToFit];
    [self.view addSubview:label];

    UIButton *closeBtn =  [[UIButton alloc] initWithFrame:CGRectMake(100, 100, 100, 30)];
    [closeBtn setTitle:@"点我关闭" forState:UIControlStateNormal];
    [closeBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    CGPoint centerB = CGPointMake(LT_ScreenCenter.x, LT_ScreenCenter.y + 50);
    closeBtn.center = centerB;
    [closeBtn addTarget:self action:@selector(tapClose) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:closeBtn];
}

- (void)tapClose {
    NSLog(@"%s",__func__);
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
