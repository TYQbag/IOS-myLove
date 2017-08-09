//
//  UIColor+Extension.m
//  UnicomTV
//
//  Created by 阳建铭 on 15/11/30.
//  Copyright © 2015年 阳建铭. All rights reserved.
// 颜色分类

#import "UIColor+Extension.h"

@implementation UIColor (Extension)

+(UIColor *)colorWithRandom{

    return  [UIColor colorWithRed:arc4random_uniform(255.0)/255.0f green:arc4random_uniform(255.0)/255.0f
                             blue:arc4random_uniform(255.0)/255.0f alpha:1.0f];

}

+ (UIColor *)Themecolor{
//236,109,0
    return [UIColor colorWithRed:236/255.0 green:109/255.0 blue:0/255.0 alpha:1];

}

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue
{
    
    return [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16))/255.0
                           green:((float)((hexValue & 0xFF00) >> 8))/255.0
                            blue:((float)(hexValue & 0xFF))/255.0 alpha:alphaValue];
}

+ (UIColor*) colorWithHex:(NSInteger)hexValue
{
    return [UIColor colorWithHex:hexValue alpha:1.0];
}

@end
