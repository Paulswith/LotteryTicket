//
//  LTUseCaseCodeViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/21.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何字体富文本设计,见书签

#import "LTUseCaseCodeViewController.h"
#import "LTHelpViewController.h"
// 屏幕尺寸
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width

@interface LTUseCaseCodeViewController ()

@end

@implementation LTUseCaseCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(15, 100, SCREEN_WIDTH - 30, 200)];
    NSString *str = @"人生若只如初见，何事悲风秋画扇。\n等闲变却故人心，却道故人心易变。\n骊山语罢清宵半，泪雨霖铃终不怨。\n何如薄幸锦衣郎，比翼连枝当日愿。";
    //创建NSMutableAttributedString
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    //设置字体和设置字体的范围
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0f] range:NSMakeRange(0, str.length)];
    //添加文字颜色
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor cyanColor] range:NSMakeRange(0, str.length)];
    //添加文字背景颜色
//    [attrStr addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:NSMakeRange(17, 7)];
    //添加下划线
//    [attrStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(8, 7)];
    //自动换行
    label.numberOfLines = 0;
    //设置label的富文本
    label.attributedText = attrStr;
    //label高度自适应
    [label sizeToFit];
    [self.view addSubview:label];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"lamp"] style:UIBarButtonItemStylePlain target:self action:@selector(helpAction)];
}

- (void)helpAction {
    [self.navigationController presentViewController:[LTHelpViewController new] animated:YES completion:nil];
}


@end
