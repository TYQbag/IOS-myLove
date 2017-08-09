//
//  MainNavigationController.m
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "MainNavigationController.h"



@interface MainNavigationController ()<UINavigationControllerDelegate>

@end

@implementation MainNavigationController

+ (void)initialize{
    
    //全局统一的导航条属性设置
    UINavigationBar *bar = [UINavigationBar appearance];
    bar.barStyle = UIBarStyleBlack;
    [bar setBackgroundImage:[[UIImage alloc] init] forBarMetrics:UIBarMetricsDefault];
    
    [bar setTranslucent:NO];
    
    [bar setBarTintColor:[UIColor colorWithHex:MainNavColor]];
    bar.tintColor = [UIColor whiteColor];
    [bar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                 [UIColor whiteColor],NSForegroundColorAttributeName,
                                 [UIFont systemFontOfSize:18],NSFontAttributeName
                                 ,nil]];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];//消除push和pop时导航条出现的阴影
    self.delegate = self;
}


#pragma mark -
#pragma mark UINavigationControllerDelegate
- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (self.viewControllers.count > 1 && viewController.navigationItem.leftBarButtonItem == nil)
    {
        viewController.navigationItem.leftBarButtonItem = [self createBackItem:viewController];
        if (viewController.navigationItem.leftBarButtonItem == nil) {
            [viewController.navigationItem setHidesBackButton:YES];
        }
    }
}

-(UIBarButtonItem *)createBackItem:(UIViewController *)viewController/**<返回按钮*/
{
    UIImage *backImage = [UIImage imageNamed:@"Back_arrow"];
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setImage:backImage forState:UIControlStateNormal];
    [backButton setImage:backImage forState:UIControlStateHighlighted];
    backButton.imageEdgeInsets=UIEdgeInsetsMake(8, -8, 8, 24);
    if ([viewController isKindOfClass:[MainNavigationController class]]) {
        //        [backButton addTarget:viewController action:@selector(actionBack) forControlEvents:UIControlEventTouchUpInside];
    } else {
        [backButton addTarget:self action:@selector(backButtonAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return [[UIBarButtonItem alloc] initWithCustomView:backButton];
}

- (void)backButtonAction /**<返回方法*/
{
    [self popViewControllerAnimated:YES];
}

@end
