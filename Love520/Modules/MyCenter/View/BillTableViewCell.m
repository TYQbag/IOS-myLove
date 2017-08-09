//
//  BillTableViewCell.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/26.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "BillTableViewCell.h"
#import "billContcell.h"

@interface BillTableViewCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout,UIScrollViewDelegate>{
    
 

}


@property (strong, nonatomic)UICollectionView *mCollectionV;

@end

@implementation BillTableViewCell

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
    self.mCollectionV=[[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260) collectionViewLayout:flowLayout];
    self.mCollectionV.dataSource=self;
    self.mCollectionV.pagingEnabled = YES;
    self.mCollectionV.delegate=self;
    self.mCollectionV.backgroundColor =[UIColor clearColor];
    self.mCollectionV.showsHorizontalScrollIndicator = NO;
    self.selectionStyle = UITableViewCellSelectionStyleNone;
    [self.mCollectionV setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    
    [self.contentView addSubview:self.mCollectionV];
    
    [self.mCollectionV registerClass:[billContcell class] forCellWithReuseIdentifier:@"billContcell"];
    
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _billMouthAry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSDictionary *dic = [_billMouthAry objectAtIndex:indexPath.row];
    
    billContcell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"billContcell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor clearColor];
    
//    NSArray *arry= [dic objectForKey:@"details"] ;
    [cell setModel:dic];
    
    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return CGSizeMake(SCREEN_WIDTH, 260);
    
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
    
    
    return 0.1;
    
}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{

    CGPoint poni =  scrollView.contentOffset;
    
    NSInteger pages = poni.x/SCREEN_WIDTH;
    
    NSString *pagesString = [NSString stringWithFormat:@"%ld",(long)pages];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"updateBill" object:@{@"pages":pagesString}];


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

-(void)setModel:(NSArray *)dataArry{
    
    _billMouthAry = dataArry;
    
   
    
    [self.mCollectionV reloadData];
    
}

@end



