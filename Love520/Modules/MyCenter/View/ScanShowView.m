//
//  ScanShowView.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/19.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "ScanShowView.h"
#import "ScanCollectionViewCell.h"

@implementation ScanShowView

- (id)initWithFrame:(CGRect)frame data:(NSArray *)inageArry
{
    self = [super initWithFrame:frame];
    if(self)
    {
        _imageArry = inageArry;
        
        [self initView];
    }
    return self;
}

-(void)initView{
 
    
    _detailL = [[UILabel alloc] init];
    _detailL.textColor = [UIColor grayColor];
    _detailL.font = [UIFont systemFontOfSize:12];
    _detailL.text = @"阴阳师定制皮肤上线，换肤转运，你的下一抽一定会是SSR！";
    _detailL.numberOfLines = 0;

    
    CGSize size = [_detailL boundingRectWithSize:CGSizeMake(SCREEN_WIDTH-18, CGFLOAT_MAX)];
    _detailL.frame = CGRectMake(8, 15, size.width, size.height);
    
    [self addSubview:_detailL];
    

    self.backgroundColor =RGBCOLOR(BackColor);
    
    _mylayout =[[ScanLatOut alloc] init];

    self.collecView=[[UICollectionView alloc] initWithFrame:CGRectMake(0, _detailL.bottom+10, SCREEN_WIDTH, 220) collectionViewLayout:_mylayout];
    self.collecView.dataSource=self;
    self.collecView.delegate=self;
    self.collecView.backgroundColor =[UIColor clearColor];
    self.collecView.showsHorizontalScrollIndicator = NO;
    [self.collecView setContentInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    self.collecView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    
    [self addSubview:self.collecView];
    
    [self.collecView registerNib:[UINib nibWithNibName:@"ScanCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"ScanCollectionViewCell"];


}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return  _imageArry.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    ScanCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"ScanCollectionViewCell" forIndexPath:indexPath];
    
    cell.backgroundColor = RGBCOLOR(BackColor);
     NSString  * imgString = [_imageArry objectAtIndex:indexPath.row] ;
    [cell.image setImage:[UIImage imageNamed:imgString]];

    return cell;
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    
    return 1;
}


- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    
    
    
    return CGSizeMake(147, 220);
    
}


//顶部的banner滚动页面---设置分区头
- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    
    return nil;
    
}






- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return  UIEdgeInsetsMake(0, 0, 0, 0);
}





@end
