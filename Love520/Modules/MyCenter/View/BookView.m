//
//  BookView.m
//  Love520
//
//  Created by 唐亚倩 on 17/7/14.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "BookView.h"
#import "ZLPhotoPickerBrowserViewController.h"

@implementation BookView

- (id)initWithFrame:(CGRect)frame pages:(NSInteger)page data:(NSDictionary *)data{
    self = [super initWithFrame:frame];
    if(self)
    {
        _data = data;
        _pages = page;
        
          [self initView];
      
//        if ([data[@"isContent"] isEqualToString:@"1"]) {
//             [self initView];
//            
//        }else if (page == 0){//封面
//        
//            [self bookBackView];
//            
//        }else if (page == 1){//介绍页
//        
//            [self bookInfoView];
//        }
        
       
    }
    return self;
}


-(void)initView{

    UIImageView *pankView = [[UIImageView alloc] initWithFrame:CGRectMake(25, 30, 17, 20)];
    pankView.image = [UIImage imageNamed:@"pank"];
    [self addSubview:pankView];
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(25, pankView.bottom, self.width-50, 0.5)];
    line.backgroundColor = [UIColor blackColor];
    [self addSubview:line];

    UILabel *timeL = [[UILabel alloc] initWithFrame:CGRectMake(pankView.right+4, line.bottom-12, 100, 11)];
    timeL.text = @"May 2016";
    timeL.font = [UIFont systemFontOfSize:10];
    [self addSubview:timeL];
    
 
    
    UIImageView *calcelImg = [[UIImageView alloc] initWithFrame:CGRectMake(25, line.bottom+25, 25, 25)];
    calcelImg.image = [UIImage imageNamed:@"cancal"];
    [self addSubview:calcelImg];
    
    UILabel *calL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 30)];
    calL.centerX = calcelImg.center.x;
    calL.centerY = calcelImg.centerY+3;
    calL.text = @"28";
    calL.font = [UIFont systemFontOfSize:10];
    calL.textAlignment = NSTextAlignmentCenter;
    [self addSubview:calL];
    
    UILabel *currL = [[UILabel alloc] initWithFrame:CGRectMake(calcelImg.right+8,calcelImg.top, 100, 25)];
    currL.text = @"09:39";
    currL.font =[UIFont systemFontOfSize:10];
    [self addSubview:currL];
    
    
    UILabel *textL = [[UILabel alloc] initWithFrame:CGRectMake(25, currL.bottom+5, self.width-50, 15)];
    textL.text = @"dsfcvdsvfdv萨城市到处都是";
    textL.font = [UIFont systemFontOfSize:10];
    [self addSubview:textL];
    
    
    UIImageView *contImg = [[UIImageView alloc] initWithFrame:CGRectMake(25, textL.bottom+5, self.width-50, 200)];
    contImg.tag = 101;
    contImg.userInteractionEnabled = YES;
    
    contImg.image = [UIImage imageNamed:@"psb-7"];
    contImg.contentMode = UIViewContentModeScaleAspectFit;
    [contImg setClipsToBounds:YES];
    [self addSubview:contImg];
    
    UILabel *pagesL = [[UILabel alloc] initWithFrame:CGRectMake(self.width-25-20, self.height-30, 20, 10)];
    pagesL.text = [NSString stringWithFormat:@"%ld",(long)_pages+1];
    pagesL.font = [UIFont systemFontOfSize:11];
    [self addSubview:pagesL];
    


//    NSArray *images = _data[@"images"];
//    
//    if (images.count == 1) {
//        
//        
//        UILabel *textL = [[UILabel alloc] initWithFrame:CGRectMake(25, currL.bottom+5, self.width-50, 15)];
//        textL.text = @"dsfcvdsvfdv萨城市到处都是";
//        textL.font = [UIFont systemFontOfSize:10];
//        [self addSubview:textL];
//        
//        
//        UIImageView *contImg = [[UIImageView alloc] initWithFrame:CGRectMake(25, textL.bottom+5, self.width-50, 200)];
//        contImg.image = [UIImage imageNamed:@"psb-12"];
//        [self addSubview:contImg];
//        
//        
//    }
    


}



-(void)bookInfoView{



}

-(void)bookBackView{
    
    

}





@end
