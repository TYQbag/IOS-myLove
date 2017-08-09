//
//  DE.h
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <Foundation/Foundation.h>

//自定义头部参数
#define DHE ([DE getInstance])

@interface DE : NSObject


//用户名
@property(nonatomic,retain)NSString* userId;
//密码
@property(nonatomic,retain)NSString* userPassword;
//头像
@property(nonatomic,retain)NSString* userHeadImg;


/**
 获得注册对象
 
 @return 注册类单例对象
 
 */
+(DE*)getInstance;
/**
 判断登录
 
 @return Bool
 
 */
-(BOOL)isLogin;



//轻量数据获取
-(id)getGlobalVar:(NSString*)key;
//轻量数据保存
-(void)setGlobalVar:(NSString*)key value:(id)value;
//移除保存的数据
-(void)removeGlobalVar:(NSString*)key;



@end
