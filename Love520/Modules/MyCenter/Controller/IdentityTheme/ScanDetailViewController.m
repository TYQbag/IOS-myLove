//
//  ScanDetailViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/19.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "ScanDetailViewController.h"
#import "ScanShowView.h"
#import "LEETheme.h"
#import "MBProgressHUD+UT.h"
#import "SSZipArchive.h"

@interface ScanDetailViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) ScanShowView *showView;
@end

@implementation ScanDetailViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addNavViewHasBack:@"皮肤详情"];
    
    
    [self.view addSubview:self.tableView];

    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    
    if(section == 1){
    
        return 1;

    }else
        return 0;
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 3;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    if (indexPath.section == 1) {
        
        return 47;
    }else
        
        return 0;


}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
            
        }
        
        cell.textLabel.text = @"白色背景";
        
        UISwitch *switchBtn = [[UISwitch alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-66, 8.5, 50, 30)];
        [switchBtn addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
    
       switchBtn.lee_theme.LeeConfigOnTintColor(@"theme");
        NSString *switchState = [DHE getGlobalVar:_scanDic[@"tag"]];
    
       if (switchState == nil || [switchState isEqualToString:@"1"]) {
        
           [switchBtn setOn:YES];
           
       }else{
       
           [switchBtn setOn:NO];

       }
    
        [cell addSubview:switchBtn];
        return cell;

    
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    
    if (section == 0) {
        
        UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170
                                                                    )];
        
        UIImageView *imageV = [[UIImageView alloc] initWithFrame:CGRectMake(16, 8, 60, 80)];
        
        imageV.image = [UIImage imageNamed:_scanDic[@"img"]];
        
        [headView addSubview:imageV];
        
        UILabel *namel = [[UILabel alloc] initWithFrame:CGRectMake(imageV.right+10, 8, SCREEN_WIDTH-imageV.right-16, 20)];
        namel.text = _scanDic[@"name"];
        [headView addSubview:namel];
        
        UILabel *sizeL = [[UILabel alloc] initWithFrame:CGRectMake(imageV.right+10, namel.bottom+10, 100, 15)];
        sizeL.text = @"6.1MB";
        sizeL.textColor = [UIColor grayColor];
        sizeL.font = [UIFont systemFontOfSize:13];
        [headView addSubview:sizeL];
        
        UIButton *stateBtn = [[UIButton alloc] initWithFrame:CGRectMake(16, imageV.bottom+25, SCREEN_WIDTH-32, 30)];
        [headView addSubview:stateBtn];
        [stateBtn addTarget:self action:@selector(checkTheme:) forControlEvents:UIControlEventTouchUpInside];
        stateBtn.layer.masksToBounds = YES;
        stateBtn.layer.cornerRadius = 15;
        
        
        if ([[LEETheme allThemeTag] containsObject:_scanDic[@"tag"]]){
            
            if ([[LEETheme currentThemeTag] isEqualToString:_scanDic[@"tag"]]){
                
                
                [stateBtn setTitle:@"使用中" forState:UIControlStateNormal];
                [stateBtn setBackgroundColor:[UIColor lightGrayColor]];
                [stateBtn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
                stateBtn.tag = 1;
                
                
            }else{
                
                [stateBtn setTitle:@"使用" forState:UIControlStateNormal];
                [stateBtn setBackgroundColor:RGBCOLOR(0x87CEFA)];
                [stateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
                stateBtn.tag = 2;
            }
            
        }else{
            
            [stateBtn setTitle:@"下载" forState:UIControlStateNormal];
            [stateBtn setBackgroundColor:RGBCOLOR(0x87CEFA)];
            [stateBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            stateBtn.tag = 3;
        }
        
        return headView;

        
    }else if (section == 2){
    
        _showView = [[ScanShowView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 260
                                                                   ) data:@[@"psb-10",@"psb-9",@"psb-13"]];
        
        return _showView;
    
    }else
        return nil;

  
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section == 0) {
        
         return 170;
    }else if (section == 1){
    
        return 0.01;
    
    }else
        return 260;
   
    

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{


    return 0.01;

}


-(UITableView *)tableView{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
        _tableView.backgroundColor = [UIColor whiteColor];
        
    }
    return _tableView;

}


-(void)checkTheme:(UIButton *)btn{

    if (btn.tag == 1) {//使用中
    
    
    }else if(btn.tag == 2){//使用
        
        NSString *redJsonPath = [[NSBundle mainBundle] pathForResource:_scanDic[@"tag"] ofType:@"json"];
        
        NSString *redJson = [NSString stringWithContentsOfFile:redJsonPath encoding:NSUTF8StringEncoding error:nil];
        
        NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        
        NSString *themePath = [[paths objectAtIndex:0]stringByAppendingPathComponent:@"theme_resources"];
        
        NSString *path = [themePath stringByAppendingPathComponent:_scanDic[@"tag"]];
        
        [LEETheme addThemeConfigWithJson:redJson Tag:_scanDic[@"tag"] ResourcesPath:path];
        
        [LEETheme startTheme:_scanDic[@"tag"]];

        
        // 启用新的主题
        [LEETheme startTheme:_scanDic[@"tag"]];
        
        [DHE setGlobalVar:@"CURRTAG" value:_scanDic[@"tag"]];
        [DHE setGlobalVar:@"CURRNAME" value:_scanDic[@"name"]];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATETHEME" object:nil];

        [DHE setGlobalVar:_scanDic[@"tag"] value:@"1"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATEBG" object:nil];
        
        [btn setTitle:@"使用中" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor lightGrayColor]];
        [btn setTitleColor:[UIColor brownColor] forState:UIControlStateNormal];
        btn.tag = 1;
        
    }else{//下载－

        [self downloadItemAction:_scanDic btn:btn];
        
    }

}


- (void)downloadItemAction:(NSDictionary *)data btn:(UIButton *)btn{
    
    // 预备唱! 大菊花吱呀吱溜溜的转..这里的风景呀真好看..天好看 地好看..还有一群快乐的小伙伴
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self.view];
    
    [hud setFrame:self.view.bounds];
    
    [hud setDetailsLabelText:@"下载皮肤中..."];
    
    [hud setRemoveFromSuperViewOnHide:YES];
    
    [hud setDetailsLabelFont:[UIFont boldSystemFontOfSize:16.0f]];
    
    hud.mode = MBProgressHUDModeIndeterminate;
    
    [self.view addSubview:hud];
    
    [hud show:YES];
    
    self.navigationItem.rightBarButtonItem.enabled = NO;
    
    // 模拟下载新的主题配置
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0f * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        hud.mode = MBProgressHUDModeText;
        
        [hud setDetailsLabelText:@"皮肤下载完成!"];
        
        [hud hide:YES afterDelay:2.0f];
        
        // 假装得到了请求的配置json数据
        
        NSString *redJsonPath = [[NSBundle mainBundle] pathForResource:data[@"tag"] ofType:@"json"];
        
        NSString *redJson = [NSString stringWithContentsOfFile:redJsonPath encoding:NSUTF8StringEncoding error:nil];
        
        // 假装下载图片资源 并缓存到沙盒的指定目录下 (建议路径 XXXX/主题资源文件夹/主题名字文件夹/)
        
        NSString *documentsPath = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES).firstObject;
        
        NSString *themePath = [documentsPath stringByAppendingPathComponent:@"theme_resources"];
        
        NSLog(@"&&&&&&&路径：%@",themePath);
 
        if (![[NSFileManager defaultManager] fileExistsAtPath:themePath]) {
            
            [[NSFileManager defaultManager] createDirectoryAtPath:themePath withIntermediateDirectories:YES attributes:nil error:nil];
        }
        


        // 假装得到了请求的配置json数据
        
        NSString *imageResPath = [[NSBundle mainBundle] pathForResource: [NSString stringWithFormat:@"%@.zip", data[@"tag"]] ofType:nil];

        BOOL a =   [SSZipArchive unzipFileAtPath:imageResPath toDestination:themePath];
        
        if(a){
        
            // 添加假装得到的的配置json数据 (添加后LEETheme会自动存储 无需下一次运行时再添加 当然同样的主题添加再多次也无所谓)
            
            NSString *path = [themePath stringByAppendingPathComponent:data[@"tag"]];
            
            
            [LEETheme addThemeConfigWithJson:redJson Tag:data[@"tag"] ResourcesPath:path];
            
            [btn setTitle:@"使用" forState:UIControlStateNormal];
            [btn setBackgroundColor:RGBCOLOR(0x87CEFA)];
            [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
            btn.tag = 2;

        }

    });
    
}

-(void)switchAction:(UISwitch *)sender{

    BOOL isButtonOn = [sender isOn];
    
    if (isButtonOn) {//白色背景
        
        [DHE setGlobalVar:_scanDic[@"tag"] value:@"1"];
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATEBG" object:nil];
        
        NSLog(@"开");
        
    }else {//背景图片
        NSLog(@"关");
         [DHE setGlobalVar:_scanDic[@"tag"] value:@"0"];
        [[NSNotificationCenter defaultCenter] postNotificationName:@"UPDATEBG" object:nil];
        
    }
    


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
