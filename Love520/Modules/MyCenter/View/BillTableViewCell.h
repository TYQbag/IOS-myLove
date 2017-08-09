//
//  BillTableViewCell.h
//  Love520
//
//  Created by 唐亚倩 on 17/6/26.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BillTableViewCell : UITableViewCell

@property (nonatomic, strong) NSArray *billMouthAry;
-(void)setModel:(NSArray *)dataArry;

@end
