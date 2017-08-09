//
//  appStoreTableViewCell.h
//  SouthChina
//
//  Created by 唐亚倩 on 17/4/5.
//  Copyright © 2017年 科创. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol appStoredelegate <NSObject>

@required //必须实现
- (void)clickapp:(NSDictionary *)data;


@end

@interface appStoreTableViewCell : UITableViewCell

@property (strong,nonatomic) NSArray *appData;
@property (strong,nonatomic) NSArray *appplyList;
@property (strong,nonatomic) NSArray *appdata;
@property (nonatomic, retain) id <appStoredelegate> delegate;

-(void)setModel:(NSDictionary *)dic;

@end
