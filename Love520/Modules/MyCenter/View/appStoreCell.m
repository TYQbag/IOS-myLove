//
//  appStoreCell.m
//  SouthChina
//
//  Created by 唐亚倩 on 17/4/5.
//  Copyright © 2017年 科创. All rights reserved.
//

#import "appStoreCell.h"
#import "LEETheme.h"

@implementation appStoreCell

- (void)awakeFromNib {
    [super awakeFromNib];
  

    // Initialization code
}

-(void)setModel:(NSDictionary *)data{

    _recomdImg.hidden = YES;
    _headImg.image = [UIImage imageNamed:data[@"img"]];
    _nameL.text = data[@"name"];
    
    
    if ([[LEETheme allThemeTag] containsObject:data[@"tag"]]){
    
        if ([[LEETheme currentThemeTag] isEqualToString:data[@"tag"]]){
        
            _stateL.text = @"使用中";
            _downStateImg.hidden = NO;
        }else{
        
            _stateL.text = @"已下载";
            _downStateImg.hidden = YES;
        
        }

    }else{
    
        _stateL.text = @"免费";
        _downStateImg.hidden = YES;
    }
   
}

@end
