//
//  AppDelegate.h
//  Love520
//
//  Created by 唐亚倩 on 17/5/19.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MainNavigationController.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *rootNav;

/**
 
 初始化恋爱时间气泡
 
 */
-(void)setTimeBuule;

@end

