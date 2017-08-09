//
//  LoginToLoveViewController.h
//  Love520
//
//  Created by 唐亚倩 on 17/5/19.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseViewController.h"

@interface LoginToLoveViewController : BaseViewController
@property (strong, nonatomic) IBOutlet UIImageView *HeadImg;
@property (strong, nonatomic) IBOutlet UITextField *LoginId;
@property (strong, nonatomic) IBOutlet UITextField *LoginPassword;
@property (strong, nonatomic) IBOutlet UIImageView *LoginToWeChat;

@property (strong, nonatomic) IBOutlet UIImageView *LoginToQQ;
@property (strong, nonatomic) IBOutlet UIButton *LoginBtn;
@end
