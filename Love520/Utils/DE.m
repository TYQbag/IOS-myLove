//
//  DE.m
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "DE.h"

@interface DE ()
{
 
    NSString* _userId;
    NSString* _userPassword;
    NSString* _userHeadImg;
    
    
}

@end

@implementation DE


#pragma mark - 初始化
+(DE*)getInstance
{
    static DE* _de = nil;
    if ( !_de )
    {
        _de = [[DE alloc] init];
    }
    return _de;
}


-(BOOL)isLogin{

   
    if ([self.userId isEqualToString:@""]) {
        
        return NO;
    }else
        return YES;

}

#pragma mark - 获取保存的值
-(id)getGlobalVar:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

#pragma mark - 保存数据
-(void)setGlobalVar:(NSString *)key value:(id)value
{
    if(value==nil || value == [NSNull class])
        return;
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

#pragma mark - 移除数据
-(void)removeGlobalVar:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}



-(NSString*)userId
{
    if ( !_userId )
    {
        _userId = [self getGlobalVar:@"userId"];
        if ( !_userId )
            _userId = @"";
    }
    return _userId;
}

-(void)setUserId:(NSString *)userId
{
    _userId = userId;
    [self setGlobalVar:@"userId" value:userId];

}

-(NSString*)userPassword
{
    if ( !_userPassword )
    {
        _userPassword = [self getGlobalVar:@"userPassword"];
        if ( !_userPassword )
            _userPassword = @"";
    }
    return _userPassword;
}

-(void)setUserPassword:(NSString *)userPassword
{
    _userPassword = userPassword;
    [self setGlobalVar:@"userPassword" value:userPassword];
}


-(NSString*)userHeadImg
{
    if ( !_userHeadImg )
    {
        _userHeadImg = [self getGlobalVar:@"userHeadImg"];
        if ( !_userHeadImg )
            _userHeadImg = @"";
    }
    return _userHeadImg;
}

-(void)setUserHeadImg:(NSString *)userHeadImg
{
    _userHeadImg = userHeadImg;
    [self setGlobalVar:@"userHeadImg" value:userHeadImg];
}


@end
