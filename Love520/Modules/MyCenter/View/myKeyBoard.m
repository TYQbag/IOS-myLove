//
//  myKeyBoard.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/28.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "myKeyBoard.h"

@implementation myKeyBoard

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self)
    {
        
        [self initView];
    }
    return self;
}

-(void)initView{
    
 self.keyboardTitle = [self keyboardTypeDoubleButtonTitle];
    
    CGFloat buttonWidth = (SCREEN_WIDTH - 2) / 4;
    CGFloat top = 0;
    for (NSInteger index = 0; index < 15; index ++) {
        
        UIButton * button = [[UIButton alloc] initWithFrame:(CGRect){(index % 4) * (buttonWidth+0.5),top+(index / 4) * 54,buttonWidth,54}];
        
        if (index == 0 || index == 4 || index == 8 || index == 12) {
            
            UILabel *liney = [[UILabel alloc] initWithFrame:CGRectMake(0, top+(index / 4) * 54, SCREEN_WIDTH, 0.3)];
            liney.backgroundColor = [UIColor blackColor];
            [self addSubview:liney];
            
            [button setBackgroundColor:[UIColor whiteColor]];
            
        }
        
        if (index == 0 || index == 1 ||index == 2) {
            
            UILabel *linex = [[UILabel alloc] initWithFrame:CGRectMake(button.right, button.top, 0.3, self.height)];
            linex.backgroundColor = [UIColor blackColor];
            [self addSubview:linex];

        }
        
        if (index == 13) {
            
            [button setBackgroundColor:[UIColor whiteColor]];

        }
        button.tag = 1000 + index;
 
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [button setBackgroundImage:[HTButton imageColor:[UIColor colorWithHTRGB:0xE7E8E9]] forState:UIControlStateNormal];
        [button setTitle:self.keyboardTitle[index] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(keyButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:button];
    }
    
    UIButton * button = [[UIButton alloc] initWithFrame:(CGRect){(15 % 4) * (buttonWidth+0.5),top+(15 / 4) * 54,buttonWidth,54}];
    [button setBackgroundColor:[UIColor whiteColor]];
    [button setTitle:@"删除" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
//    [button setImage:[UIImage imageNamed:@"keyboard_delete"] forState:UIControlStateNormal];
//    [button setBackgroundImage:[UIButton imageColor:[UIColor colorWithHTRGB:0xE7E8E9]] forState:UIControlStateNormal];
//    [button.button setBackgroundImage:[HTButton imageColor:[UIColor colorWithHTRGB:0xf7f7f7]] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(deleteButtonOnclick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];

    


}

- (void)keyButtonOnclick:(UIButton *) button {
    
    if([self.delegate respondsToSelector:@selector(numberKeyboard:clickBtn: chnagBtn:)]) {
        
        NSInteger index = button.tag- 1000;
        
        UIButton *btn = (UIButton *)[self viewWithTag:1000];
        
        NSString *text = self.keyboardTitle[index];
    
        [self.delegate numberKeyboard:text clickBtn:button chnagBtn:btn];
        
    }
}

- (void)deleteButtonOnclick:(UIButton *) button {
    
    UIButton *btn = (UIButton *)[self viewWithTag:1000];

    [self.keyboardTitle replaceObjectAtIndex:0 withObject:@"="];
    
    
    [self.delegate textFieldShouldDelete:btn];
}



- (NSMutableArray *)keyboardTypeDoubleButtonTitle {
    
    NSArray *arry =  @[@"=",@"1",@"2",@"3",@"x",@"4",@"5",@"6",@"－",@"7",@"8",@"9",@"+",@".",@"0",@"删"];
    
    NSMutableArray *multArry = [[NSMutableArray alloc] initWithArray:arry];
    return multArry;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
