//
//  ScanShowView.h
//  Love520
//
//  Created by 唐亚倩 on 17/6/19.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ScanLatOut.h"

@interface ScanShowView : UIView<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

- (id)initWithFrame:(CGRect)frame data:(NSArray *)inageArry;

@property (nonatomic, strong) UICollectionView *collecView;
@property (nonatomic, strong) ScanLatOut *mylayout;
@property (nonatomic, strong) NSArray  *imageArry;
@property (nonnull,strong) UILabel *detailL;

@end
