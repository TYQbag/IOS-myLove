//
//  HomeViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/5/19.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "HomeViewController.h"
#import "LoginToLoveViewController.h"
#import "CHCardView.h"
#import "CHCardItemCustomView.h"
#import "CHCardItemModel.h"
#import "LEETheme.h"
#import "LEEBubble.h"

@interface HomeViewController ()

@property (nonatomic, strong) NSMutableArray *dataArray;
//@property (nonatomic, weak) CHCardView *cardView;
@property (nonatomic, strong) UIImageView *backV ;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];

    [self addNavViewNoBack:@"" rightBtn:@"" leftType:NO];
    
    [self setUpViews];
    
}

- (void)setUpViews {
    
    UIImageView *backImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64)];
    backImg.image = [UIImage imageNamed:@"psb-11"];

    [self.view addSubview:backImg];
    
    
//    UIImageView *boyImg = [[UIImageView alloc] initWithFrame:CGRectMake(20, 20, 50, 50)];
//    
//    boyImg.image = [UIImage imageNamed:@"timg-10"];
//    
//    [backImg addSubview:boyImg];
//    
//    UILabel *timeL = [[UILabel alloc] initWithFrame:CGRectMake(boyImg.right+5, boyImg.top+15, 30, 20)];
//    timeL.text  = @"相恋2103天";
//    [backImg addSubview:timeL];
//    
//    UIImageView *girlImg = [[UIImageView alloc] initWithFrame:CGRectMake(timeL.right+5, 20, 50, 50)];
//    
//    girlImg.image = [UIImage imageNamed:@"timg-11"];
//    
//    [backImg addSubview:girlImg];
//    

    
    NSArray *array = [NSArray arrayWithObjects:@"日常",@"话题", nil];
    //初始化UISegmentedControl
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]initWithItems:array];
    //设置frame
    segmentedControl.frame = CGRectMake((SCREEN_WIDTH-100)/2, 25, 100, 30);
    segmentedControl.selectedSegmentIndex = 0;
    segmentedControl.tintColor = [UIColor whiteColor];
    //添加到视图
    [self.titlebar addSubview:segmentedControl];
    


//    UIButton *centerBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.view.frame.size.width / 2.0 - leftBtn.frame.size.width / 2.0, leftBtn.frame.origin.y, leftBtn.frame.size.width, leftBtn.frame.size.height)];
//    [self.view addSubview:centerBtn];
//    [centerBtn setTitle:@"重置" forState:UIControlStateNormal];
//    centerBtn.titleLabel.font = [UIFont systemFontOfSize:18];
//    [centerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//    [centerBtn addTarget:self action:@selector(resetBtnClick:) forControlEvents:UIControlEventTouchUpInside];
//    
//    UIButton *rightBtn = [[UIButton alloc] initWithFrame:CGRectMake(self.cardView.frame.origin.x + self.cardView.frame.size.width - leftBtn.frame.size.width, leftBtn.frame.origin.y, leftBtn.frame.size.width, leftBtn.frame.size.height)];
//    [self.view addSubview:rightBtn];
//    [rightBtn setTitle:@"喜欢" forState:UIControlStateNormal];
//    rightBtn.titleLabel.font = [UIFont systemFontOfSize:18];
//    [rightBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
//    [rightBtn addTarget:self action:@selector(likeBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    
}



-(void)rightBtn{
    

}

//
//- (void)resetBtnClick:(UIButton *)btn {
//    
//    [self loadData];
//    
//    [self.cardView reloadData];
//}
//
//- (void)likeBtnClick:(UIButton *)btn {
//    [self.cardView deleteTheTopItemViewWithLeft:NO];
//}
//
//// data
//- (void)loadData {
//    
////    // 随机切换..
//    NSInteger random = arc4random_uniform(1000);
//    if (random % 2 == 0) {
//        //  本地数据
//        [self.dataArray removeAllObjects];
//        for (int i = 0; i < 21; i++) {
//            CHCardItemModel *itemModel = [[CHCardItemModel alloc] init];
//            itemModel.localImagename = [NSString stringWithFormat:@"psb-%d", i + 1];
//            [self.dataArray addObject:itemModel];
//        }
//    }
//    
//}
//
//#pragma mark - CHCardViewDelegate
//- (NSInteger)numberOfItemViewsInCardView:(CHCardView *)cardView {
//    return self.dataArray.count;
//}
//
//- (CHCardItemView *)cardView:(CHCardView *)cardView itemViewAtIndex:(NSInteger)index {
//    CHCardItemCustomView *itemView = [[CHCardItemCustomView alloc] initWithFrame:cardView.bounds];
//    itemView.itemModel = self.dataArray[index];
//    return itemView;
//}
//
//- (void)cardViewNeedMoreData:(CHCardView *)cardView {
//    
//    // data
//    [self loadData];
//    
//    // reload
//    [self.cardView reloadData];
//}
//
//// select
//- (void)cardView:(CHCardView *)cardView didClickItemAtIndex:(NSInteger)index { }
//
//- (NSMutableArray *)dataArray {
//    if (!_dataArray) {
//        _dataArray = [NSMutableArray array];
//    }
//    return _dataArray;
//}

//- (CHCardView *)cardView {
//    if (!_cardView) {
//        CHCardView *cardView = [[CHCardView alloc] initWithFrame:CGRectMake(40, 10, self.view.frame.size.width - 80, 300)];
//        [self.view addSubview:cardView];
//        
//        _cardView = cardView;
//        cardView.delegate = self;
//        cardView.dataSource = self;
//    }
//    return _cardView;
//}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
