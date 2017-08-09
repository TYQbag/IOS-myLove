//
//  appStoreTableViewCell.m
//  SouthChina
//
//  Created by 唐亚倩 on 17/4/5.
//  Copyright © 2017年 科创. All rights reserved.
//

#import "appStoreTableViewCell.h"
#import "appStoreCell.h"
#import "appStoreHeadView.h"

@interface appStoreTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>{
    
    appStoreHeadView *headView;
    
}


@property (strong, nonatomic)UICollectionView *mCollectionV;

@end


@implementation appStoreTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{

    
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        self.mCollectionV.backgroundColor =self.backgroundColor;
        [self setupCollectionView];
        
    }
    return self;

}

- (void)setupCollectionView{
    
    
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
    flowLayout.minimumLineSpacing =3;
    flowLayout.minimumInteritemSpacing =5;
    flowLayout.sectionInset = UIEdgeInsetsMake(0, 10, 15, 10);
    self.mCollectionV=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 38, SCREEN_WIDTH, 190) collectionViewLayout:flowLayout];
    self.mCollectionV.dataSource=self;
    self.mCollectionV.delegate=self;
    self.mCollectionV.backgroundColor =[UIColor clearColor];
    self.mCollectionV.showsHorizontalScrollIndicator = NO;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.mCollectionV setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];

    [self.contentView addSubview:self.mCollectionV];
 
    [self.mCollectionV registerNib:[UINib nibWithNibName:@"appStoreCell" bundle:nil] forCellWithReuseIdentifier:@"appStoreCell"];

    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _appplyList.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    appStoreCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"appStoreCell" forIndexPath:indexPath];

    cell.backgroundColor = RGBCOLOR(BackColor);
    NSDictionary *dic= [_appplyList objectAtIndex:indexPath.row] ;
    [cell setModel:dic];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    

    return CGSizeMake((SCREEN_WIDTH-6)/3, 190);
    
}

//
////顶部的banner滚动页面---设置分区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{

    return nil;

}


- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{

    return  UIEdgeInsetsMake(0, 0, 0, 0);
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{


    return 5;

}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

     NSDictionary *model = [_appplyList objectAtIndex:indexPath.row] ;

    //判断是否实现了点击更多代理
    if ([self.delegate respondsToSelector:@selector(clickapp:)]) {
        [self.delegate clickapp:model];
        
    }
    
}

#pragma mark 获取父类控制器viewController
- (UIViewController*)viewController {
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

-(void)setModel:(NSDictionary *)dic{

    _appplyList = dic[@"scans"];
    
    if (!headView) {
        
        headView = [[appStoreHeadView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 38)];
        
        [self addSubview:headView];
    }
    
    headView.titleL.text =  [dic objectForKey:@"title"];
    
    [self.mCollectionV reloadData];

}

@end
