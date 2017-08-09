//
//  MyCenterViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/5/22.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "MyCenterViewController.h"
#import "DetailInfoViewController.h"
#import "LoginToLoveViewController.h"
#import "BillMainViewcontroller.h"
#import "BroadViewController.h"
#import "ThemeViewController.h"
#import "UIImageView+LBBlurredImage.h"
#import "HMDatePickView.h"
#import "LEETheme.h"
#import "personView.h"
#import "detailView.h"
#import "AppConstant.h"

@interface MyCenterViewController ()<UITextFieldDelegate,UITableViewDelegate,UITableViewDataSource,detailDelegate>{

    NSArray *cellArry;
}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) personView *headView1;
@property (nonatomic, strong) detailView *headView2;
@end

@implementation MyCenterViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    [self addNavViewNoBack:@"我"];

    [self.view addSubview:self.tableView];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64-49)];

    cellArry = @[@[@"个性换肤",@"情侣闹钟",@"时间泡泡"],@[@"设置",@"关于",@"分享小冤家"],@[@"退出登录"]];
    
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    
    if (indexPath.section == 2 || indexPath.section == 3 ||indexPath.section == 4) {
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
        }
        
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        cell.textLabel.text = [[cellArry objectAtIndex:indexPath.section-2] objectAtIndex:indexPath.row];
        cell.textLabel.font = [UIFont systemFontOfSize:14];
        
        cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame] ;
        cell.selectedBackgroundView.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
        
        if (self.themeW == nil || [self.themeW isEqualToString:@"1"]) {
            
          cell.textLabel.textColor = [UIColor lightGrayColor];
          cell.backgroundColor = [UIColor whiteColor];

            
        }else{
        
            cell.textLabel.lee_theme.LeeConfigTextColor(@"text");
            cell.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];

        
        }
        
        if(indexPath.section == 2){
        
            if (indexPath.row == 2) {
                
                cell.accessoryType = UITableViewCellAccessoryNone;
                
                UISwitch *switchs = (UISwitch *)[cell viewWithTag:102];
                
                if (!switchs) {
                    
                    UISwitch *open = [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-50-16, 6.5, 50, 25)];
                    open.lee_theme.LeeConfigOnTintColor(@"theme");
                    open.tag = 102;
                    [open addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];//开关事件切换通知
                    [cell addSubview:open];
                    open.on = YES;
                    
                    open.lee_theme.LeeConfigTintColor(@"text");
                }
                

            }else if (indexPath.row == 0){
            
                UILabel *L = (UILabel *)[cell viewWithTag:101];
                
                if (!L) {
                    UILabel *scanL = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-128, 14, 100, 15)];
                    scanL.textColor = [UIColor lightGrayColor];
                    scanL.tag = 101;
                    scanL.font = [UIFont systemFontOfSize:13];
                    scanL.textAlignment = NSTextAlignmentRight;
                    scanL.text = [DHE getGlobalVar:@"CURRNAME"];
                    [cell addSubview:scanL];
                }else
                    L.text = [DHE getGlobalVar:@"CURRNAME"];
                
            }
        }
        
        if (indexPath.section == 3) {
            
            if (indexPath.row == 1 || indexPath.row == 2) {
                
                 cell.accessoryType = UITableViewCellAccessoryNone;
            }
        }else if (indexPath.section == 4){
            
             cell.accessoryType = UITableViewCellAccessoryNone;
            
            cell.textLabel.text = @"";
        
            UILabel *loginOutL = [[UILabel alloc] initWithFrame:cell.frame];
            loginOutL.text = @"退出登录";
            loginOutL.font = [UIFont systemFontOfSize:14];
            loginOutL.textAlignment = NSTextAlignmentCenter;
            [cell addSubview:loginOutL];
            
            if (self.themeW == nil || [self.themeW isEqualToString:@"1"]) {
                
                loginOutL.textColor = [UIColor lightGrayColor];
                
            }else{
                
                loginOutL.lee_theme.LeeConfigTextColor(@"text");
                
            }

        
        }
        
        return cell;
        
    }else
        return nil;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (indexPath.section == 2) {
        
        if (indexPath.row == 0) {
            
            ThemeViewController *themeV = [[ThemeViewController alloc] init];
            [kAppDelegate.rootNav pushViewController:themeV animated:YES];
        }
        
    }else if (indexPath.section == 4){
    
        [self loginClick];
    
    }

}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        
        _headView1 = [[personView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 70)];
        
        
        
        UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickPerson)];
        
        [_headView1 addGestureRecognizer:gesture];
        
        if (self.themeW == nil || [self.themeW isEqualToString:@"1"]) {
            
            _headView1.nameL.textColor = [UIColor blackColor];
            _headView1.gradeL.textColor = [UIColor lightGrayColor];
            _headView1.backgroundColor = [UIColor clearColor];
            
        }else{
            
            _headView1.nameL.lee_theme.LeeConfigTextColor(@"text");
            _headView1.gradeL.lee_theme.LeeConfigTextColor(@"text");
            _headView1.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.3];

            
        }

        return _headView1;
        
        
    }else if(section == 1){
    
        _headView2 = [[detailView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 105)];
        _headView2.delegate = self;
        
        return _headView2;
    
    }

    return nil;


}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if(section == 0){
    
        return 70;
    }else if(section == 1){
    
        return 105;
    }else
        return 0.1;
    
        

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{

    return 10;
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{

    if (section !=4) {
        
        UIView *footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 10)];
        footView.backgroundColor = [UIColor colorWithWhite:0.2 alpha:0.2];
        return footView;
    }else
        return [[UIView alloc] init];


}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0 || indexPath.section == 1) {
        
        return 0.1;
    }else
        return 43;

}


-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 5;

}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{


    if (section == 2 || section == 3 ||section == 4) {
        return [[cellArry objectAtIndex:section-2] count];
    }
    return 0;

}



-(UITableView *)tableView{

    
    if(!_tableView){
    
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH,SCREEN_HEIGHT-64-49 ) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.tableFooterView = [[UIView alloc] init];

    }

    return _tableView;

}


-(void)clickPerson{


    DetailInfoViewController *infoV = [[DetailInfoViewController alloc] init];
    [kAppDelegate.rootNav pushViewController:infoV animated:YES
     ];


}

-(void)clickBtn:(NSInteger )tag{

    if (tag == 0) {//账单
        
        BillMainViewcontroller *billV = [[BillMainViewcontroller alloc] init];
        [kAppDelegate.rootNav pushViewController:billV animated:YES];
    }else if (tag == 1){
    
        BroadViewController *broadV = [[BroadViewController alloc] init];
        [kAppDelegate.rootNav pushViewController:broadV animated:YES];
    
    }
}

-(void)switchAction:(id)sender
{
    UISwitch *switchButton = (UISwitch*)sender;
    BOOL isButtonOn = [switchButton isOn];
    if (isButtonOn) {
        
        /** 自定义日期选择器 */
        
        HMDatePickView *datePickVC = [[HMDatePickView alloc] initWithFrame:self.view.frame];
        //距离当前日期的年份差（设置最大可选日期）
        datePickVC.maxYear = -1;
        //设置最小可选日期(年分差)
        //    _datePickVC.minYear = 10;
        datePickVC.date = [NSDate date];
        //设置字体颜色
        datePickVC.fontColor = [UIColor redColor];
        //日期回调
        datePickVC.completeBlock = ^(NSString *selectDate) {
            
            
            
            [DHE setGlobalVar:@"STARTTIME" value:selectDate];
            
            [kAppDelegate setTimeBuule];

            
//            [self.dateBtn setTitle:selectDate forState:UIControlStateNormal];
        };
        //配置属性
        [datePickVC configuration];
        
        [self.view addSubview:datePickVC];
        
//
    }else {
      
        for(UIView *view in kAppDelegate.window.subviews){
            
            if (view.tag  == 2002) {
                
                [view removeFromSuperview];
            }
        }

        
    }
}

-(void)updateThemeBg{

    [super updateThemeBg];
    
    [_tableView reloadData];

}

-(void)loginClick{
    
    DHE.userId = @"";
    DHE.userPassword = @"";
    
    for(UIView *view in kAppDelegate.window.subviews){
        
        if (view.tag  == 2002) {
            
            [view removeFromSuperview];
        }
    }
    LoginToLoveViewController *login = [[LoginToLoveViewController alloc] init];
    
    if (kAppDelegate.rootNav) {
        
        [kAppDelegate.rootNav setViewControllers:@[login] animated:YES];
    }
   
}

-(void)dealloc{


}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
