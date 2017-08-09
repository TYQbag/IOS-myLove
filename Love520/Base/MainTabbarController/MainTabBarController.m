//
//  MainTabBarController.m
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "MainTabBarController.h"
#import "HomeViewController.h"
#import "MyCenterViewController.h"
#import "CommViewController.h"
#import "MainNavigationController.h"
#import "LEETheme.h"

@interface MainTabBarController ()<UITabBarControllerDelegate>

@end

@implementation MainTabBarController

+(MainTabBarController*)getInstance
{
    static MainTabBarController* tabbarViewController = nil;
    if ( !tabbarViewController )
    {
        tabbarViewController = [[MainTabBarController alloc] init];
    }
    return tabbarViewController;
}

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    HomeViewController *homV = [HomeViewController new];
    CommViewController *ComunV = [CommViewController new];
    MyCenterViewController *MyCenterV = [MyCenterViewController new];
    
    self.viewControllers = @[homV,ComunV,MyCenterV];

    //背景透明
    self.tabBar.translucent = YES;
    
    
    //去掉黑线，但是。。。，还是放张图片上去
    self.tabBar.barStyle = UIBarStyleBlack;

    
    self.tabBar.lee_theme.LeeConfigBackgroundImage(@"tabImg");
    
    self.delegate = self;
    
    UITabBarItem *item1 = [self.tabBar.items objectAtIndex:0];
    UITabBarItem *item2 = self.tabBar.items[1];
    UITabBarItem *item3 = self.tabBar.items[2];

    NSArray *arry = @[item1,item2,item3];
    
    NSArray *titls = @[@"首页",@"社区",@"我的"];
    for(NSInteger i = 0;i<arry.count;i++){
    
        UITabBarItem *item = [arry objectAtIndex:i];
        
        item.title= [titls objectAtIndex:i];
        
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor whiteColor], NSForegroundColorAttributeName,
                                      [UIFont systemFontOfSize:10.0],NSFontAttributeName,
                                      nil] forState:UIControlStateSelected];
        
        [item setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                      [UIColor blackColor], NSForegroundColorAttributeName,
                                      [UIFont systemFontOfSize:10.0],NSFontAttributeName,
                                      nil] forState:UIControlStateNormal];
        
        item.imageInsets = UIEdgeInsetsMake(-25, 0, 25, 0);
        
        NSString *nomlTag = [NSString stringWithFormat:@"tab%ld",i+1];
        NSString *selectTag = [NSString stringWithFormat:@"tabS%ld",i+1];
    
        item.lee_theme.LeeCustomConfig(nomlTag, ^(UITabBarItem *item, id value) {

            UIImage *image = value;
            if (image)
                item.image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        });
        
        item.lee_theme.LeeCustomConfig(selectTag, ^(UITabBarItem *item, id value) {

            UIImage *image = value;
            if (image)
                item.selectedImage = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
        });
    
    }


}

-(void)viewWillAppear:(BOOL)animated{


    self.navigationController.navigationBarHidden = YES;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];

    
    
}


@end
