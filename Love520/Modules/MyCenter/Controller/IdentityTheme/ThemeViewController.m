//
//  ThemeViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/6.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "ThemeViewController.h"
#import "ScanDetailViewController.h"
#import "appStoreTableViewCell.h"
#import "SSZipArchive.h"
#import "LEETheme.h"
#import "MBProgressHUD.h"

@interface ThemeViewController ()<UITableViewDelegate,UITableViewDataSource,appStoredelegate>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray  *scanList;

@end

@implementation ThemeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addNavViewHasBack:@"个性换肤" rightBtn:@"我的" leftType:NO];

    [self.view addSubview:self.tableView];
    
    _scanList = @[@{@"title":@"推荐",@"scans":@[@{@"name":@"阴阳师",@"img":@"yiyang",@"tag":@"yiyang",@"state":@"1"},@{@"name":@"海洋馆",@"img":@"ocenS",@"tag":@"ocen",@"state":@"1"},@{@"name":@"NBA",@"img":@"NBA",@"tag":@"red",@"state":@"0"}]},@{@"title":@"动漫卡通",@"scans":@[@{@"name":@"阴阳师",@"img":@"yiyang",@"tag":@"yiyang",@"state":@"0"},@{@"name":@"海洋馆",@"img":@"ocenS",@"tag":@"ocen",@"state":@"0"},@{@"name":@"NBA",@"img":@"NBA",@"tag":@"red",@"state":@"0"}]},@{@"title":@"青春",@"scans":@[@{@"name":@"阴阳师",@"img":@"yiyang",@"tag":@"yiyang",@"state":@"0"},@{@"name":@"海洋馆",@"img":@"ocenS",@"tag":@"ocen",@"state":@"0"},@{@"name":@"NBA",@"img":@"NBA",@"tag":@"red",@"state":@"0"}]}];
    
}

-(void)viewWillAppear:(BOOL)animated{

    [_tableView reloadData];

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    static NSString * CellIdentifier = @"appStoreTableViewCell";
    
    appStoreTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell) {
        cell = [[appStoreTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        [cell setSelectionStyle:UITableViewCellSelectionStyleNone];
        cell.delegate = self;
        
    
    }
    cell.backgroundColor = [UIColor clearColor];
    
    [cell setModel:[_scanList objectAtIndex:indexPath.section]];

    return cell;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    ScanDetailViewController *detailV = [[ScanDetailViewController alloc] init];
    [kAppDelegate.rootNav pushViewController:detailV animated:YES];

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{


    return 228;

}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    return 0.1;

}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return _scanList.count;

}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 1;

}

-(UITableView *)tableView{

    if (!_tableView) {
        
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_WIDTH, SCREEN_HEIGHT-64) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.backgroundColor = [UIColor clearColor];
        
    }

    return _tableView;

}

- (void)clickapp:(NSDictionary *)data{
    
    ScanDetailViewController *detailV = [[ScanDetailViewController alloc] init];
    detailV.scanDic = data;
    [kAppDelegate.rootNav pushViewController:detailV animated:YES];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
 
    
}

@end
