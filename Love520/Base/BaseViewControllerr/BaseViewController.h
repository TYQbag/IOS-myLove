//
//  BaseViewController.h
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>

#define TITLE_BAR_HEGIHT (64)

@interface BaseViewController : UIViewController

//自定义导航栏
@property(nonatomic,retain) UIView *titlebar;
@property(nonatomic,retain) UILabel *lableTitle;
@property (nonatomic, strong) NSString *themeW;

/**
 添加导航栏文字，不带返回按钮
 
 @param title 导航栏标题文字
 
 */
-(void)addNavViewNoBack:(NSString *)title;
/**
 添加导航栏文字，带返回按钮
 
 @param title 导航栏标题文字
 
 */
-(void)addNavViewHasBack:(NSString *)title;
/**
 添加导航栏文字，带返回按钮,带右按钮
 
 @param title 导航栏标题文字
 @param rightTitle 右按钮文字，或图片
 @param isImg 左按钮的类型  BOOL类型 YES 取消 NO 返回的图片
 
 */
-(void)addNavViewHasBack:(NSString *)title  rightBtn:(NSString *)rightTitle leftType:(bool)isImg;
/**
 添加导航栏文字，不带返回按钮，带右按钮
 
 @param title 导航栏标题文字
 @param rightTitle 右按钮文字，或图片
 @param isImg 左按钮的类型  BOOL类型 YES 取消 NO 返回的图片
 
 
 */
-(void)addNavViewNoBack:(NSString *)title  rightBtn:(NSString *)rightTitle leftType:(bool)isImg;

/**
 导航栏左按钮返回事件
 */
- (void)clickback ;
/**
 导航栏右按钮返回事件
 */
-(void)rightBtn;


-(void)updateThemeBg;

@end
