//
//  personView.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/2.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "personView.h"
#import "Masonry.h"
@implementation personView


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
    
    self.backgroundColor = [UIColor whiteColor];
    
    UIImageView *rowImg = [[UIImageView alloc] init];
        [self addSubview:rowImg];
    [rowImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(9, 13));
        make.right.equalTo(self.mas_right).with.offset(-16);
        make.top.equalTo(self.mas_top).with.offset(28.5);
        
        
    }];
    rowImg.image = [UIImage imageNamed:@"row"];

    
    _headImg = [[UIImageView alloc] init];
        _headImg.layer.cornerRadius = 20;
    _headImg.clipsToBounds = YES;
    [self addSubview:_headImg];
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(40, 40));
        make.left.equalTo(self.mas_left).with.offset(16);
        make.top.equalTo(self.mas_top).with.offset(15);
        
        
    }];
    
    _headImg.image = [UIImage imageNamed:DHE.userHeadImg];

    
    _nameL = [[UILabel alloc] init];
    _nameL.text = @"想";
    _nameL.font = [UIFont systemFontOfSize:16];
    [self addSubview:_nameL];
    [_nameL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.height.equalTo(@20);
        make.left.equalTo(_headImg.mas_right).with.offset(8);
        make.right.equalTo(rowImg.mas_left).with.offset(-8);
        make.top.equalTo(self.mas_top).with.offset(15);
   
    }];
    
    _gradeImgV = [[UIImageView alloc] init];
    _gradeImgV.image = [UIImage imageNamed:@"crown1"];
    _gradeImgV.layer.masksToBounds = YES;
    _gradeImgV.layer.cornerRadius = 7.5;
    [self addSubview:_gradeImgV];

    [_gradeImgV mas_makeConstraints:^(MASConstraintMaker *make) {
        
        
        make.size.mas_equalTo(CGSizeMake(15, 15));
        make.top.equalTo(_nameL.mas_bottom).with.offset(5);
        make.left.equalTo(_nameL.mas_left).with.offset(0);
        
        
    }];
    
    _gradeL = [[UILabel alloc] init];
    _gradeL.text = @"金婚";
    _gradeL.font = [UIFont systemFontOfSize:11];
    _gradeL.textColor = [UIColor lightGrayColor];
    [self addSubview:_gradeL];
    
    [_gradeL mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.left.equalTo(_gradeImgV.mas_right).with.offset(3);
        make.right.equalTo(self.mas_right).with.offset(-16);
        make.height.mas_equalTo(@15);
        make.top.equalTo(_gradeImgV.mas_top).with.offset(0);
        
        
    }];

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
