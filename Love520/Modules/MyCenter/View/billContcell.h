//
//  billContcell.h
//  Love520
//
//  Created by 唐亚倩 on 17/6/26.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface billContcell : UICollectionViewCell

@property (nonatomic, strong) NSDictionary *billData;

-(void)setModel:(NSDictionary *)billDic;

@end
