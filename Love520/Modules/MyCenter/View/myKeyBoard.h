//
//  myKeyBoard.h
//  Love520
//
//  Created by 唐亚倩 on 17/6/28.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol KeyboardDelegate <NSObject>

/** 点击删除按钮 */
- (BOOL)textFieldShouldDelete:(UIButton *)btn;
/** 点击键盘输入相应数字及特殊字符 */
- (void)numberKeyboard:(NSString *)string clickBtn:(UIButton *)btn chnagBtn:(UIButton *)changBtn;

@end

@interface myKeyBoard : UIView

@property (nonatomic, strong) NSMutableArray *keyboardTitle;
@property (nonatomic, assign) id<KeyboardDelegate> delegate;
@end
