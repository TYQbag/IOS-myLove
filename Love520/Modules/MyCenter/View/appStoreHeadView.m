//
//  appStoreHeadView.m
//  SouthChina
//
//  Created by 唐亚倩 on 17/4/5.
//  Copyright © 2017年 科创. All rights reserved.
//

#import "appStoreHeadView.h"

@implementation appStoreHeadView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
  
        [self initView];
    }
    return self;
}




-(void)initView{

    self.backgroundColor = RGBCOLOR(BackColor);
    _titleL = [[UILabel alloc] initWithFrame:CGRectMake(12, 9, 150, 20)];
    _titleL.font = [UIFont systemFontOfSize:15];
    _titleL.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_titleL];
    
    _showAll = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 3, self.height-20)];
    _showAll.backgroundColor = [UIColor redColor];
    [self addSubview:_showAll];

}


@end
