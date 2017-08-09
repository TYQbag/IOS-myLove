//
//  BroadViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/29.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "BroadViewController.h"
#import "SingleBookViewController.h"
#import "RemberCell.h"
#import <AVFoundation/AVFoundation.h>
#import <MobileVLCKit/MobileVLCKit.h>


@interface BroadViewController ()<VLCMediaPlayerDelegate,UICollectionViewDelegate,UICollectionViewDataSource>

@property(nonatomic, strong)VLCMediaPlayer *meidaPlayer;
@property(nonatomic, strong)NSArray *dataArray;

@property (nonatomic, strong) UICollectionView *mCollectionV;
@property (nonatomic, strong) NSArray *appplyList;

@end

@implementation BroadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
     [self addNavViewHasBack:@"我的纪念册"];
    
    _appplyList = @[@{@"cover":@"book1",@"name":@"情人节"},@{@"cover":@"book2",@"name":@"四周年"},@{@"cover":@"book3",@"name":@"哈哈哈"},@{@"cover":@"book",@"name":@""}];
    
    [self setupCollectionView];
    
    
    
//    UIView *videoView = [[UIView alloc] initWithFrame:CGRectMake(0, 50, self.view.bounds.size.width, 200)];
//    [self.view addSubview:videoView];
//    [videoView setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight];
    
    //播放器
//    _meidaPlayer = [[VLCMediaPlayer alloc] initWithOptions:nil];
//    self.meidaPlayer.drawable = videoView;
//    
//    VLCMedia  *media = [VLCMedia mediaWithURL:[NSURL URLWithString:@"rtmp://live.hkstv.hk.lxdns.com/live/hks"]];
//    [_meidaPlayer setMedia:media];
//    [_meidaPlayer play];
//  
//    
//    _dataArray = @[@"rtmp://live.hkstv.hk.lxdns.com/live/hks",@"rtmp://202.69.69.180:443/webcast/bshdlive-pc",@"rtmp://123.108.164.71/etv2/phd926",@"rtmp://122.202.129.136:1935/live/ch5",@"rtmp://live.chosun.gscdn.com/live/tvchosun1.stream",@"rtmp://110.164.48.237:1935/tcctv_ch002/tcctv02.stream_live1",@"rtmp://media3.sinovision.net:1935/live/livestream",@"rtmp://tv.unbtv.tv/app_2/ls_1.stream"];
   
    // Do any additional setup after loading the view.
}

- (void)setupCollectionView{
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
    flowLayout.minimumLineSpacing =3;
    flowLayout.minimumInteritemSpacing =5;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 15, 10);
    self.mCollectionV=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) collectionViewLayout:flowLayout];
    self.mCollectionV.dataSource=self;
    self.mCollectionV.delegate=self;
    self.mCollectionV.backgroundColor =[UIColor clearColor];
    self.mCollectionV.showsHorizontalScrollIndicator = NO;
    [self.mCollectionV setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self.view addSubview:self.mCollectionV];
    
    [self.mCollectionV registerNib:[UINib nibWithNibName:@"RemberCell" bundle:nil] forCellWithReuseIdentifier:@"RemberCell"];
    
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _appplyList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    RemberCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"RemberCell" forIndexPath:indexPath];
    
    NSDictionary *dic= [_appplyList objectAtIndex:indexPath.row] ;
    cell.coverImg.image = [UIImage imageNamed:dic[@"cover"]];
    cell.nameL.text = dic[@"name"];
    return cell;
   
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    if ((_appplyList.count-1)%3>1) {
        
        return (_appplyList.count+1)/3+1;
    }
    
    return (_appplyList.count+1)/3;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return CGSizeMake((SCREEN_WIDTH-15*4)/3, 154);
    
}

//
////顶部的banner滚动页面---设置分区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
    
}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return  UIEdgeInsetsMake(5, 15, 0, 15);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    
    
    return 5;
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSDictionary *dic = [_appplyList objectAtIndex:indexPath.row] ;
    
    SingleBookViewController *singleBook = [[SingleBookViewController alloc] init];
    [kAppDelegate.rootNav pushViewController:singleBook animated:YES];
    

//    //判断是否实现了点击更多代理
//    if ([self.delegate respondsToSelector:@selector(clickapp:)]) {
//        [self.delegate clickapp:model];
//        
//    }
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
