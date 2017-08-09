//
//  detailView.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/2.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "detailView.h"
#import "LEETheme.h"

@implementation detailView


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

    NSString * currTag = [DHE getGlobalVar:@"CURRTAG"];
    
    if(currTag == nil)
        currTag = @"";
    
    NSString *whiteBg = [DHE getGlobalVar:currTag];
    
    self.backgroundColor =[UIColor whiteColor];
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(16, 10, 100, 15)];
    titleL.text = @"我的日常";
    titleL.font = [UIFont systemFontOfSize:15];
    [self addSubview:titleL];
    
    if (whiteBg == nil || [whiteBg isEqualToString:@"1"]) {
        
        self.backgroundColor = [UIColor clearColor];
        
        titleL.textColor = [UIColor blackColor];
        
    }else{
        
        self.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];
        titleL.lee_theme.LeeConfigTextColor(@"text");
        
        
    }

    
    UILabel *lin2 = [[UILabel alloc] initWithFrame:CGRectMake(0, titleL.bottom+10, SCREEN_WIDTH, 0.5)];
    lin2.backgroundColor = RGBCOLOR(BackColor);
    [self addSubview:lin2];
    
    NSArray *detaiArry = @[@"账单",@"纪念册",@"纪念日",@"足迹",@"树洞"];
    NSArray *imgArry = @[@"流汗",@"懵B",@"天使",@"吐舌",@"眨眼"];
    
    CGFloat gap = (SCREEN_WIDTH-32-35*5)/4;
    
    for(int i = 0;i<detaiArry.count;i++){
        
        UIView *btnView = [[UIView alloc] initWithFrame:CGRectMake(16+gap*i+35*i, lin2.bottom+15, 35, 50)];
        btnView.tag = i;
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        [btnView addGestureRecognizer:gesture];
        
        UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(7.5, 0, 20, 20)];
        img.image = [UIImage imageNamed:[imgArry objectAtIndex:i]];
        [btnView addSubview:img];
        
        UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, img.bottom+5, 35, 15)];
        title.font = [UIFont systemFontOfSize:11];
        title.text = [detaiArry objectAtIndex:i];
        title.textAlignment = NSTextAlignmentCenter;
        [btnView addSubview:title];
        
        
        if (whiteBg == nil || [whiteBg isEqualToString:@"1"]) {
            
            title.textColor = [UIColor grayColor];
            
        }else{
            
            title.lee_theme.LeeConfigTextColor(@"text");

        }

        
        [self addSubview:btnView];
        
        
    }
    
}

-(void)click:(UIGestureRecognizer *)gesture{
    
    NSLog(@"%@",self.delegate);

    if (self.delegate && [self.delegate respondsToSelector:@selector(clickBtn:)]) {
        
        [self.delegate clickBtn:gesture.view.tag];
    }

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
