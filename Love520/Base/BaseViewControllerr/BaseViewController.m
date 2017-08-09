//
//  BaseViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "BaseViewController.h"
#import "LEETheme.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

@synthesize lableTitle;

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateThemeBg) name:@"UPDATEBG" object:nil];
    
    
    if (self.themeW == nil || [self.themeW isEqualToString:@"1"]) {
        
        self.view.backgroundColor = RGBCOLOR(BackColor);
        
    }else{
        
        self.view.lee_theme.LeeCustomConfig(@"backImg", ^(UIView *views, id value) {
            
            UIImage *image = value;
            if (image){
                
                views.layer.contents = (id) image.CGImage;
                
            }
            
        });
        
    }
    
    
}


-(void)addNavViewNoBack:(NSString *)title{
    
    
    [self addNavView:title backBtn:NO leftType:NO];
    
}

-(void)addNavViewHasBack:(NSString *)title{
    
    
    [self addNavView:title backBtn:YES leftType:NO];
    
}


-(void)addNavViewHasBack:(NSString *)title  rightBtn:(NSString *)rightTitle leftType:(bool)isImg{
    
    [self addNavViewNoBack:title rightBtn:rightTitle btnType:isImg HasBack:YES];
    
}

-(void)addNavViewNoBack:(NSString *)title  rightBtn:(NSString *)rightTitle leftType:(bool)isImg{
    
    
    [self addNavViewNoBack:title rightBtn:rightTitle btnType:isImg HasBack:NO];
    
    
}

-(void)addNavViewNoBack:(NSString *)title rightBtn:(NSString *)rightTitle btnType:(BOOL) isImg HasBack:(BOOL)hasBack{
    
    [self addNavView:title backBtn:hasBack leftType:isImg];
    
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if(rightTitle!=nil && rightTitle.length>0){
        
        rightBtn.frame =CGRectMake(SCREEN_WIDTH-64, (20)+2,60.0f, 40.0f);
        rightBtn.titleLabel.font = [UIFont systemFontOfSize:17];
        rightBtn.titleLabel.textColor = [UIColor whiteColor];
        [rightBtn setTitle:rightTitle forState:UIControlStateNormal];
        
    }else{
        
        rightBtn.backgroundColor = [UIColor clearColor];
        rightBtn.contentVerticalAlignment = YES;
        rightBtn.imageEdgeInsets =UIEdgeInsetsMake ( 0 ,  0 , 0 , 0 );
        rightBtn.frame = CGRectMake(SCREEN_WIDTH-44, (20)+10, 30, 30);
        [rightBtn setImage:[UIImage imageNamed:rightTitle] forState:UIControlStateNormal];
        
    }
    
    [rightBtn addTarget:self action:@selector(rightBtn) forControlEvents:UIControlEventTouchUpInside];
    [_titlebar addSubview:rightBtn];
    
    
}

-(void)addNavView:(NSString *)title backBtn:(BOOL)hasBack leftType:(BOOL)isCancel{
    
    _titlebar= [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, TITLE_BAR_HEGIHT)];
    
    if (self.themeW == nil || [self.themeW isEqualToString:@"1"]) {
        
        
        _titlebar.lee_theme.LeeCustomConfig(@"navImg", ^(UIView *views, id value) {
            
            UIImage *image = value;
            if (image){
                
                views.layer.contents = (id) image.CGImage;
                
            }
            
        });
        
        
    }else{
        
        _titlebar.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
        _titlebar.layer.contents = nil;
        
    }
    
    lableTitle = [[UILabel alloc]initWithFrame:CGRectMake(40.0f, 20, SCREEN_WIDTH-80, 40)];
    lableTitle.text = title;
    lableTitle.textAlignment = NSTextAlignmentCenter;
    lableTitle.textColor = [UIColor whiteColor];
    lableTitle.backgroundColor = [UIColor clearColor];
    lableTitle.font = [UIFont systemFontOfSize:20.0];
    lableTitle.lee_theme.LeeAddTextColor(DAY,[UIColor whiteColor])
    .LeeAddTextColor(NIGHT,[UIColor whiteColor]);
    
    [_titlebar addSubview:lableTitle];
    
    if(hasBack){
        
        UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
        
        if (isCancel) {
            
            btnBack.frame = CGRectMake(10.0f, (20)+8, 50, 30.0f);
            [btnBack setTitle:@"取消" forState:UIControlStateNormal];
            
        }else{
            
            btnBack.frame = CGRectMake(10.0f, (20)+8, 25.0f, 30.0f);
            [btnBack setImage: [UIImage imageNamed:@"icon_leftArrow_white.png"] forState:UIControlStateNormal];
            
        }
        
        [btnBack addTarget:self action:@selector(clickback) forControlEvents:UIControlEventTouchUpInside];
        [_titlebar addSubview:btnBack];
    }
    
    [self.view addSubview:_titlebar];
    
}


//返回上一级页面
- (void)clickback {
    
    [kAppDelegate.rootNav popViewControllerAnimated:YES];
    
}

//导航栏右按钮点击事件
-(void)rightBtn{
    
    
    
}

-(void)updateThemeBg{
    
    
    
    
    if (self.themeW == nil || [self.themeW isEqualToString:@"1"]) {
        
        self.view.backgroundColor = RGBCOLOR(BackColor);
        self.view.layer.contents = nil;
        
        if (_titlebar) {
            
            _titlebar.lee_theme.LeeCustomConfig(@"navImg", ^(UIView *views, id value) {
                
                UIImage *image = value;
                if (image){
                    
                    views.layer.contents = (id) image.CGImage;
                    
                }
                
            });
        }
        
        
    }else{
        
        self.view.lee_theme.LeeCustomConfig(@"backImg", ^(UIView *views, id value) {
            
            UIImage *image = value;
            if (image){
                
                views.layer.contents = (id) image.CGImage;
                
            }
            
        });
        
        
        if (_titlebar) {
            
            _titlebar.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
            _titlebar.layer.contents = nil;
        }
        
        
    }
    
    
    
}

-(NSString *)themeW{
    
    NSString * currTag = [DHE getGlobalVar:@"CURRTAG"];
    
    if(currTag == nil)
        currTag = @"";
    
    NSString *whiteBg = [DHE getGlobalVar:currTag];
    
    return whiteBg;
    
}

-(void)dealloc{
    
    
    [[NSNotificationCenter defaultCenter] removeObserver:self name:@"UPDATEBG" object:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
