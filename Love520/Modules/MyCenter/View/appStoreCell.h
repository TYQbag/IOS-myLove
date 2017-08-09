//
//  appStoreCell.h
//  SouthChina
//
//  Created by 唐亚倩 on 17/4/5.
//  Copyright © 2017年 科创. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface appStoreCell : UICollectionViewCell
//皮肤海报图片
@property (strong, nonatomic) IBOutlet UIImageView *headImg;
//皮肤名字
@property (strong, nonatomic) IBOutlet UILabel *nameL;
//推荐图片
@property (strong, nonatomic) IBOutlet UIImageView *recomdImg;
//状态
@property (strong, nonatomic) IBOutlet UILabel *stateL;
//下载标识
@property (strong, nonatomic) IBOutlet UIImageView *downStateImg;

-(void)setModel:(NSDictionary *)data;

@end
