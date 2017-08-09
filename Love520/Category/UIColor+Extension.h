//
//  UIColor+Extension.h
//  UnicomTV
//
//  Created by 阳建铭 on 15/11/30.
//  Copyright © 2015年 阳建铭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Extension)
/**
 *  随机颜色
 *
 */
+ (UIColor *)colorWithRandom;
/**
 *  主题颜色 橙色
 *
 */
+ (UIColor *)Themecolor;

+ (UIColor*) colorWithHex:(NSInteger)hexValue alpha:(CGFloat)alphaValue;
+ (UIColor*) colorWithHex:(NSInteger)hexValue;
@end
