//
//  KeepAcountViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/27.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "KeepAcountViewController.h"
#import "MBProgressHUD+UT.h"
#import "myKeyBoard.h"
#import "YLButton.h"

@interface KeepAcountViewController ()<KeyboardDelegate>{

    myKeyBoard *keyBoardView;
    UITextField *filedV ;

}



@end

@implementation KeepAcountViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavViewHasBack:@"" rightBtn:@"保存" leftType:YES];
    
    [self initKeyBoardView];
    
    NSArray *billArry = @[@"餐饮",@"零食",@"礼物",@"交通",@"购物",@"工资",@"宠物",@"孩子",@"住房",@"旅行",@"服饰",@"游戏",@"社交",@"话费",@"医疗",@"娱乐",@"数码",@"支付"];
        [self initSortShop:billArry];
    

}

-(void)initSortShop:(NSArray *)billArry{

    NSArray *billSelect = @[@"餐饮s",@"零食s",@"礼物s",@"交通s",@"购物s",@"工资s",@"宠物s",@"孩子s",@"住房s",@"旅行s",@"服饰s",@"游戏s",@"社交s",@"话费s",@"医疗s",@"娱乐s",@"数码s",@"支付s"];

    CGFloat gap = SCREEN_WIDTH / 6;
    
    CGFloat top = 80;
    for (int index =0; index<billArry.count; index++) {
        
        YLButton *btn = [YLButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake((index % 6) * (gap), top+(index / 6) * 60, gap, 70);
        btn.titleLabel.font = [UIFont systemFontOfSize:11];
        [btn.titleLabel setTextAlignment:NSTextAlignmentCenter];
        btn.tag = 100+index;
        
        btn.imageRect = CGRectMake((gap-25)/2, 10, 25, 25);
        btn.titleRect = CGRectMake(0, 45, btn.width, 15);
        [btn setTitle:billArry[index] forState:UIControlStateNormal];

        [btn setImage:[UIImage imageNamed:billArry[index]] forState:UIControlStateNormal];
        
        [btn setImage:[UIImage imageNamed:billSelect[index]] forState:UIControlStateHighlighted];
        
        [self.view addSubview:btn];
        
    }

}
-(void)initKeyBoardView{

    
    keyBoardView = [[myKeyBoard alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-216, SCREEN_WIDTH, 216)];
    keyBoardView.delegate = self;

    
    filedV = [[UITextField alloc] initWithFrame:CGRectMake(60, 20, SCREEN_WIDTH-120, 40)];
    filedV.inputView = keyBoardView;
    filedV.textAlignment = NSTextAlignmentCenter;
    [filedV becomeFirstResponder];
    [self.titlebar addSubview:filedV];

    
}

-(void)clickback{


    [self dismissViewControllerAnimated:YES completion:nil];

}

-(void)rightBtn{

    if (![self deptNumInputShouldNumber:filedV.text]) {
        
        return;
        
    }else if (filedV.text.length == 0){
    
        return;
    
    }else{
    
    
    
    }
    
    

}

- (BOOL)textFieldShouldDelete:(UIButton *)btn{
    
    NSString *str = filedV.text;
    
    if (str.length>0) {
        NSString *text = [str substringToIndex:[str length] - 1];
        
        if (text.length==0) {
            
            btn.tag = 1000;
            [btn setTitle:@"=" forState:UIControlStateNormal];
        }
        
        filedV.text = text;
    }
    return YES;

}

- (void)numberKeyboard:(NSString *)string clickBtn:(UIButton *)btn chnagBtn:(UIButton *)changBtn{

    
    if([self deptNumInputShouldNumber:string]){
        
        if (filedV.text.length>1) {
            
            if ([filedV.text containsString:@"x"] ||[filedV.text containsString:@"+"]||[filedV.text containsString:@"－"]) {
                
                 [changBtn setTitle:@"=" forState:UIControlStateNormal];
                
            }
            
        }else{
        
             [changBtn setTitle:@"完成" forState:UIControlStateNormal];
        
        }

    }

    if ([string isEqualToString:@"完成" ]) {//完成
        
        [self.view endEditing:YES];
        return;
        
        
    }else if([string isEqualToString:@"="]){//等于，计算值
    
        if (filedV.text.length>1) {
            
            [self todo:nil];
            
            return;
            
        }

    }else if(btn.tag == 1004 || btn.tag == 1008 || btn.tag == 1012){
    
        if (filedV.text.length>0) {
            
            NSString *aa = [filedV.text substringFromIndex:filedV.text.length-1];
            
            if (![self deptNumInputShouldNumber:aa]) {
                
                
                return;
                
            }

        }
        
        if (filedV.text.length>1) {
            
            [changBtn setTitle:@"=" forState:UIControlStateNormal];
            
            [self todo:string];
        }
    }

    NSString *str = filedV.text;
    NSString *text = [NSString stringWithFormat:@"%@%@",str,string];
    filedV.text = text;

}


-(void)todo:(NSString *)string{

    if([filedV.text containsString:@"x"]){
        
        NSArray *array = [filedV.text componentsSeparatedByString:@"x"];
        
        float results = [array[0] floatValue]*[array[1] floatValue];
        NSString *resString = [NSString stringWithFormat:@"%.1f",results];
        filedV.text = resString;
        
        if (string) {
            
            NSString *reString = [NSString stringWithFormat:@"%@",resString];
            filedV.text = reString;
            
        }
        
    }else if ([filedV.text containsString:@"+"]){
        
        NSArray *array = [filedV.text componentsSeparatedByString:@"+"];
        
        float results = [array[0] floatValue]+[array[1] floatValue];
        
        NSString *resString = [NSString stringWithFormat:@"%.1f",results];
        filedV.text = resString;
        
        if (string) {
            
            NSString *reString = [NSString stringWithFormat:@"%@",resString];
            filedV.text = reString;
            
        }
        
        
    }else if ([filedV.text containsString:@"－"]){
        
        NSArray *array = [filedV.text componentsSeparatedByString:@"－"];
        
        float results = [array[0] floatValue]-[array[1] floatValue];
        
        NSString *resString = [NSString stringWithFormat:@"%.1f",results];
        filedV.text = resString;
        
        if (string) {
            
            NSString *reString = [NSString stringWithFormat:@"%@",resString];
            
            filedV.text = reString;
            
        }
        
    }



}

//判断字符串是数字
- (BOOL) deptNumInputShouldNumber:(NSString *)str
{
    NSString *regex = @"[0-9]*";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex];
    if ([pred evaluateWithObject:str]) {
        return YES;
    }
    return NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
