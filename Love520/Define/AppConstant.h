//
//  AppConstant.h
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#ifndef AppConstant_h
#define AppConstant_h

// 系统版本
#define SYTEM_VERSION [[UIDevice currentDevice].systemVersion floatValue]

#define IOS8 ([[UIDevice currentDevice].systemVersion doubleValue] >= 8.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 9.0)
#define IOS8_10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0 && [[UIDevice currentDevice].systemVersion doubleValue] < 10.0)
#define IOS10 ([[[UIDevice currentDevice] systemVersion] floatValue] >= 10.0)

#define kAppDelegate ((AppDelegate*)[UIApplication sharedApplication].delegate)

//屏幕高
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height
//屏幕宽
#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width

#define RGBCOLOR(color)  [UIColor colorWithHex:color]

//导航栏主题颜色
#define MainNavColor 0xEEA2AD


#define BreakLine 0xAEEEEE
#define BackColor 0xF5F5F5
#define NewTitleColor 0x838383

#define DAY @"day"

#define NIGHT @"night"



#endif /* AppConstant_h */
