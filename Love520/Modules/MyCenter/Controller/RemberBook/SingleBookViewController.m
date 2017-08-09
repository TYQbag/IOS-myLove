//
//  SingleBookViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/7/5.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "SingleBookViewController.h"
#import "LeavesView.h"
#import "Utilities.h"
#import "BookView.h"

@interface SingleBookViewController ()<LeavesViewDelegate,LeavesViewDataSource>{
    
    
    
}
@property (readonly) NSArray *images;

@end

@implementation SingleBookViewController

- (id)init {
    if (self = [super init]) {
        
        _images =@[@{@"isContent":@"0",@"time":@"201608"},@{@"isContent":@"1",@"time":@"201608200945",@"images":@[@"psb-7",@"psb-8",@"",@"psb-9"],@"text":@"饭后 i 哦额的负荷东方 v 金额"},@{@"isContent":@"1",@"time":@"201608121145",@"images":@[@"psb-11",@"psb-10"],@"text":@"今天就是这么开心！"},@{@"isContent":@"0",@"time":@"201705"},@{@"isContent":@"0",@"time":@"201705081145",@"images":@[@"psb-3"],@"text":@"大煞风景哦拍摄！"},@{@"isContent":@"0",@"time":@"201707"},@{@"isContent":@"0",@"time":@"201707141145",@"images":@[@"psb-4",@"psb-6",@"psb-5"],@"text":@"工资时间发我"}];
        
        
        
    }
    return self;
}

- (id)initWithNibName:(NSString *)nibName bundle:(NSBundle *)nibBundle {
    if (self = [super initWithNibName:nibName bundle:nibBundle]) {
        _leavesView = [[LeavesView alloc] initWithFrame:CGRectZero];
        _leavesView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
        _leavesView.dataSource = self;
        _leavesView.delegate = self;
    }
    return self;
}

- (void)dealloc {
    [_leavesView release];
    [super dealloc];
}

#pragma mark LeavesViewDataSource

- (NSUInteger)numberOfPagesInLeavesView:(LeavesView*)leavesView {
    return 3;
}

- (void)renderPageAtIndex:(NSUInteger)index inContext:(CGContextRef)ctx {
    
    CGRect bounds = CGContextGetClipBoundingBox(ctx);
    
    BookView *view= [[[BookView alloc] initWithFrame:bounds pages:index data:0] autorelease];
    view.backgroundColor = [UIColor colorWithHex:BackColor];
    
    CGAffineTransform verticalFlip = CGAffineTransformMake(1, 0, 0, -1, 0, bounds.size.height);
    CGContextConcatCTM(ctx, verticalFlip);
    
    view.layer.contentsScale = [UIScreen mainScreen].scale;
    
    [view.layer renderInContext:ctx];
    
    
}

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavViewHasBack:@"哈哈哈"];
    
    _leavesView.frame = CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-100);
    [self.view addSubview:_leavesView];
    [_leavesView reloadData];
    
    [self bootomView];
}


-(void)bootomView{
    
    UIView *bootomView = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-100, SCREEN_WIDTH, 100)];
    bootomView.backgroundColor = [UIColor colorWithWhite:0.5 alpha:0.3];
    
    [self.view addSubview:bootomView];
    
    //创建滑动条对象
    UISlider * slider = [[UISlider alloc]init];
    //位置设置，高度不可变更，40写的不起作用，系统默认
    slider.frame =CGRectMake(32, 5, SCREEN_WIDTH-64, 40);
    
    UIImage *imagea=[self OriginImage:[UIImage imageNamed:@"psb-6"] scaleToSize:CGSizeMake(15, 15)];
    
    [slider setThumbImage:imagea forState:UIControlStateHighlighted];
    [slider setThumbImage:imagea forState:UIControlStateNormal];
    
    //设置滑动条最大值
    slider.maximumValue= 3;
    //设置滑动条的最小值，可以为负值
    slider.minimumValue=0;
    //设置滑动条的滑块位置float值
    slider.value=0;
    //左侧滑条背景颜色
    slider.minimumTrackTintColor=[UIColor blackColor];
    //右侧滑条背景颜色
    slider.maximumTrackTintColor=[UIColor lightGrayColor];
    
    //对滑动条添加事件函数
    [slider addTarget:self action:@selector(pressSlider:) forControlEvents:UIControlEventValueChanged];
    [bootomView addSubview:slider];
    
}



-(UIImage *)OriginImage:(UIImage *)image scaleToSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0,0, size.width, size.height)];
    UIImage *scaleImage=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return scaleImage;
}

-(void)pressSlider:(UISlider *)slinder{
    
    NSLog(@"%@",[NSString stringWithFormat:@"*****%.1f", slinder.value]) ;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
