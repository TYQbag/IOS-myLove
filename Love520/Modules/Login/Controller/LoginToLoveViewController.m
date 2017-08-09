//
//  LoginToLoveViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/5/19.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "LoginToLoveViewController.h"
#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MBProgressHUD+UT.h"
#import "LEETheme.h"


@interface LoginToLoveViewController ()<UINavigationControllerDelegate>
@property (nonatomic,strong) id popDelegate;

@end




@implementation LoginToLoveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //代理
    self.popDelegate = self.navigationController.interactivePopGestureRecognizer.delegate;
    self.navigationController.delegate = self;
    
}

-(void)viewWillAppear:(BOOL)animated{
    
    if ([DHE isLogin]) {
        
        
        MainTabBarController *tabView = [MainTabBarController getInstance];
        
        kAppDelegate.rootNav = self.navigationController;
        
        NSLog(@"lancher----%@",self.navigationController);
        
        
        [self.navigationController setViewControllers:@[tabView] animated:NO];
        
    }else{
        
        [self.navigationController setNavigationBarHidden:YES];
        
        self.view.lee_theme.LeeAddBackgroundColor(DAY,RGBCOLOR(MainNavColor))
        .LeeAddBackgroundColor(NIGHT,RGBCOLOR(BreakLine));
        
        [self ininXib];
        
    }
    
}

#pragma UINavigationControllerDelegate方法
- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    //实现滑动返回功能
    //清空滑动返回手势的代理就能实现
    self.navigationController.interactivePopGestureRecognizer.delegate =  viewController == self.navigationController.viewControllers[0]? self.popDelegate : nil;
}

-(void)ininXib{
    
    _HeadImg.layer.masksToBounds = YES;
    _HeadImg.layer.cornerRadius = 40;
    
    _LoginBtn.layer.masksToBounds = YES;
    _LoginBtn.layer.cornerRadius = 5;
    
    _LoginToQQ.layer.masksToBounds = YES;
    _LoginToWeChat.layer.masksToBounds = YES;
    _LoginToWeChat.layer.cornerRadius = 17.5;
    _LoginToQQ.layer.cornerRadius = 17.5;
    
    _LoginBtn.lee_theme.LeeAddButtonTitleColor(DAY,RGBCOLOR(MainNavColor),UIControlStateNormal)
    .LeeAddButtonTitleColor(NIGHT,RGBCOLOR(BreakLine),UIControlStateNormal);
    
    if ([DHE isLogin] ) {
        
        _HeadImg.image = [UIImage imageNamed:DHE.userHeadImg];
        _LoginId.text = DHE.userId;
        _LoginPassword.text = DHE.userPassword;
    }else{
        
        _HeadImg.image = [UIImage imageNamed:@"11"];
        
    }
    
}


- (IBAction)clickToHomeV:(UIButton *)sender {
    
    [self.view endEditing:YES];
    
    if (_LoginId.text.length == 0 || _LoginPassword.text.length == 0) {
        
        //        [MBProgressHUD showMessage:@"请输入帐号" toView:self.view];
        
        return;
    }
    
    DHE.userId = _LoginId.text;
    DHE.userPassword = _LoginPassword.text;
    DHE.userHeadImg = @"psb-11";
    
    [kAppDelegate setTimeBuule];
    
    
    kAppDelegate.rootNav = self.navigationController;
    
    MainTabBarController *mainTabV = [MainTabBarController getInstance];
    [self.navigationController setViewControllers:@[mainTabV] animated:YES];
}


- (IBAction)ChangePassword:(UIButton *)sender {
}


- (IBAction)RegisterToParTner:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
