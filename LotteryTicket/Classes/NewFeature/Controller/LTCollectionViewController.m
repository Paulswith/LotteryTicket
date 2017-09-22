//
//  LTCollectionViewController.m
//  LotteryTicket
//
//  Created by Dobby on 2017/9/14.
//  Copyright © 2017年 Dobby. All rights reserved.
//  如何版本更新入场动画,混乱了点~~

#import "LTCollectionViewController.h"
#import "LTCollectionViewCell.h"

// 屏幕尺寸
#define LT_SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width
#define LT_SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define LT_ANIMATION_DURATION 0.35
#define LT_PAGE_COUNT 4
@interface LTCollectionViewController ()
@property(strong,nonatomic) UIImageView *guide; //球图
@property(assign,nonatomic) CGFloat lastOffsetX; //lastContentOffsetX
@property(strong,nonatomic) UIImageView *guideLargeText; //大图
@property(strong,nonatomic) UIImageView *guideSmallText; //小图
@end

@implementation LTCollectionViewController

static NSString * const reuseIdentifier = @"Cell";

- (instancetype)init {
    // 重写init的时候, 载入UICollectionViewLayout的方法
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.minimumLineSpacing = 0.0;
    flowLayout.minimumInteritemSpacing = 0.0; //间距
    flowLayout.itemSize = CGSizeMake(LT_SCREEN_WIDTH, LT_SCREEN_HEIGHT); //单个大小
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;  //水平布局
    return [super initWithCollectionViewLayout:flowLayout];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.collectionView registerClass:[LTCollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
    self.collectionView.pagingEnabled = YES; //分页效果,
    self.collectionView.bounces = NO; //取消弹簧效果
    self.collectionView.showsHorizontalScrollIndicator = NO; //隐藏水平滚动条
    [self setupItem];
}

- (void)setupItem {
    NSLog(@"%s",__func__);
    UIImageView *guideLine = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLine"]];
    guideLine.x -= 150;  //矫正画面
    [self.collectionView addSubview:guideLine];
    
    self.guide = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guide1"]];
    self.guide.x += 50; //矫正画面
    //初次加载的动画逻辑
    self.guide.x -= LT_SCREEN_WIDTH;
    [self.collectionView addSubview:self.guide];
    [UIView animateWithDuration:LT_ANIMATION_DURATION animations:^{
        self.guide.x += LT_SCREEN_WIDTH;
    }]; //动画
    
    self.guideLargeText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideLargeText1"]];
    self.guideLargeText.center = CGPointMake(self.collectionView.width /2 , self.collectionView.height * 0.7f );
    [self.collectionView addSubview:self.guideLargeText];
    
    self.guideSmallText = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"guideSmallText1"]];
    self.guideSmallText.center = CGPointMake(self.collectionView.width /2 , self.collectionView.height * 0.8f );
    [self.collectionView addSubview:self.guideSmallText];
    
}

#pragma mark - scrollViewDelegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    CGFloat currentOffsetX =  scrollView.contentOffset.x - self.lastOffsetX;  //每次拖动屏幕的偏移量 +-375
    
    NSInteger index = fabs(scrollView.contentOffset.x)/fabs(currentOffsetX); //索引
    // mark - BUG: 当前拖动一点点,然后松开, 出现Index溢出?问题
    NSLog(@"总偏移量%f - 本偏移量%f, 计算index=%zd",scrollView.contentOffset.x,currentOffsetX,index);
    
    self.guideLargeText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideLargeText%zd",index + 1]];
    self.guideSmallText.image = [UIImage imageNamed:[NSString stringWithFormat:@"guideSmallText%zd",index + 1]];
    self.guide.image = [UIImage imageNamed:[NSString stringWithFormat:@"guide%zd",index + 1]];
    
    self.guide.x += 2 * currentOffsetX;  //移动到两个偏移量后
    self.guideLargeText.x += 2 * currentOffsetX;
    self.guideSmallText.x += 2 * currentOffsetX;
    
    [UIView animateWithDuration:LT_ANIMATION_DURATION animations:^{
        self.guide.x -= currentOffsetX; //再减去一个偏移量, 回到当前屏幕
        self.guideLargeText.x -= currentOffsetX;
        self.guideSmallText.x -= currentOffsetX;
    }];
    self.lastOffsetX = scrollView.contentOffset.x;   //保存每次的偏移量,来得到+-375
}

#pragma mark <UICollectionViewDataSource>
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return LT_PAGE_COUNT;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LTCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    if (!cell) {
        cell = [[LTCollectionViewCell alloc] init];
    }
    NSString *bgImageName = [NSString stringWithFormat:@"guide%zdBackground",indexPath.item + 1];
    cell.bgImage = [UIImage imageNamed:bgImageName];
    [cell setJumpbutttonIndex:indexPath.item count:LT_PAGE_COUNT];
    return cell;
}

@end
