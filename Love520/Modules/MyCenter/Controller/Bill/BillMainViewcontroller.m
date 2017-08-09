//
//  BillMainViewcontrollerViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/21.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "BillMainViewcontroller.h"
#import "KeepAcountViewController.h"
#import "LEETheme.h"
#import "BillTableViewCell.h"
#import "Masonry.h"



@interface BillMainViewcontroller ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>{


    NSInteger pages;

}

@property(nonatomic, strong)UITableView *tableView;
@property(nonatomic, strong)NSArray  *dataArry;
@property (nonatomic,strong) UIView *headView;

@property (nonatomic, strong) NSArray *detailArry;



@end

@implementation BillMainViewcontroller

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    [self addNavViewHasBack:@"账单"];
    self.titlebar.backgroundColor = [UIColor clearColor];
    
    pages = 0;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(updateBill:) name:@"updateBill" object:nil];

    [self.view addSubview:self.tableView];
    
    [_tableView registerClass:[BillTableViewCell class] forCellReuseIdentifier:@"BillTableViewCell"];
  
    _dataArry = @[@[@{@"payAll":@"3200",@"mouth":@"6",@"inCome":@"6000",@"bugGet":@"3000",@"details":@[@{@"money":@"500",@"name":@"约会"},@{@"money":@"500",@"name":@"网购"},@{@"money":@"700",@"name":@"日常"},@{@"money":@"1500",@"name":@"人情"}]},@{@"payAll":@"5900",@"mouth":@"5",@"inCome":@"6000",@"bugGet":@"3000",@"details":@[@{@"money":@"500",@"name":@"约会"},@{@"money":@"500",@"name":@"网购"},@{@"money":@"700",@"name":@"日常"},@{@"money":@"1500",@"name":@"人情"},@{@"money":@"2700",@"name":@"出行"}]},@{@"payAll":@"3200",@"mouth":@"4",@"inCome":@"6000",@"bugGet":@"3000",@"details":@[@{@"money":@"500",@"name":@"约会"},@{@"money":@"500",@"name":@"网购"},@{@"money":@"700",@"name":@"日常"},@{@"money":@"1500",@"name":@"人情"}]}]];
    
    _detailArry =  @[@[@{@"time":@"6月20号",@"bills":@[@{@"name":@"薪资",@"moneys":@"8000",@"remark":@"开心",@"state":@"1"},@{@"name":@"出行",@"moneys":@"2700",@"remark":@"终于买了小车车",@"state":@"0"}]},@{@"time":@"6月14号",@"bills":@[@{@"name":@"约会",@"moneys":@"350",@"remark":@"4周年了",@"state":@"0"},@{@"name":@"借出",@"moneys":@"2500",@"remark":@"帮助下",@"state":@"0"}]}],
  @[@{@"time":@"5月20号",@"bills":@[@{@"name":@"投资",@"moneys":@"8000",@"remark":@"开心",@"state":@"1"},@{@"name":@"出行",@"moneys":@"2700",@"remark":@"终于买了小车车",@"state":@"0"}]},@{@"time":@"5月15号",@"bills":@[@{@"name":@"约会",@"moneys":@"350",@"remark":@"4周年了",@"state":@"0"},@{@"name":@"借出",@"moneys":@"2500",@"remark":@"帮助下",@"state":@"0"}]}],
  @[@{@"time":@"4月26号",@"bills":@[@{@"name":@"投资",@"moneys":@"8000",@"remark":@"开心",@"state":@"1"},@{@"name":@"出行",@"moneys":@"2700",@"remark":@"终于买了小车车",@"state":@"0"}]},@{@"time":@"4月15号",@"bills":@[@{@"name":@"吃饭",@"moneys":@"350",@"remark":@"4周年了",@"state":@"0"},@{@"name":@"借出",@"moneys":@"2500",@"remark":@"帮助下",@"state":@"0"}]}]];  ;
    
    
}



-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    NSArray *detaiA = [_detailArry objectAtIndex:pages];
    
    return 1+detaiA.count;


}

-(NSInteger )tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    if (section == 0) {
        return 1;
    }
    
     NSArray *detaiA = [_detailArry objectAtIndex:pages];
    
    NSDictionary *dic =[detaiA objectAtIndex:section-1];
    
    NSArray *detaArry = dic[@"bills"];


    return detaArry.count;

}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (indexPath.section == 0) {
        
        NSArray *dataArry= [_dataArry objectAtIndex:indexPath.section];
        
        BillTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"BillTableViewCell" forIndexPath:indexPath];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        [cell setModel:dataArry];
        cell.backgroundColor = [UIColor clearColor];
     
        
        return cell;

    }else{
    
        NSArray *detaiA = [_detailArry objectAtIndex:pages];

        
        NSDictionary *dic =[detaiA objectAtIndex:indexPath.section-1];
        
        NSArray *detaArry = dic[@"bills"];
        
        NSDictionary *dddd = [detaArry objectAtIndex:indexPath.row];
    
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
        
        if (!cell) {
            
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        }
        
        cell.backgroundColor = [UIColor clearColor];

        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.font = [UIFont systemFontOfSize:15];
        cell.textLabel.text = dddd[@"name"];
        cell.textLabel.textColor = [UIColor whiteColor];
        
        UILabel *moneyL = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-16-100, 12.5, 100, 20)];
     
        moneyL.textColor = [UIColor whiteColor];
        moneyL.font = [UIFont systemFontOfSize:15];
        moneyL.textAlignment = NSTextAlignmentRight;
        [cell addSubview:moneyL];
        
        if ([dddd[@"state"] isEqualToString:@"0"]) {
            
               moneyL.text =  [NSString stringWithFormat:@"-¥%@",dddd[@"moneys"]] ;;
        }else
               moneyL.text =  [NSString stringWithFormat:@"+¥%@",dddd[@"moneys"]] ;;
    
  
        return cell;
    
    
    }
    
    return nil;
    

    
  
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{

    
    if (section>=1) {
        
        NSArray *detaiA = [_detailArry objectAtIndex:pages];

        NSDictionary *dic= [detaiA objectAtIndex:section-1];
        
        UIView *headV = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 30)];
        headV.backgroundColor = [UIColor clearColor];
        
        
        UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(16, 10, 80, 20)];
        titleL.text = @"账单明细";
        titleL.textColor = [UIColor whiteColor];
        [headV addSubview:titleL];
        
        UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-16-50, 10, 50, 25)];
        [btn setTitle:@"按时间" forState:UIControlStateNormal];
        [btn setBackgroundColor:[UIColor colorWithWhite:1 alpha:0.2]];
        [btn.titleLabel setFont:[UIFont systemFontOfSize:13]];
        [btn addTarget:self action:@selector(clickBtn) forControlEvents:UIControlEventTouchUpInside];
        btn.layer.masksToBounds = YES;
        btn.layer.cornerRadius = 5;
        [headV addSubview:btn];
        
        UIButton *accountBtn = [[UIButton alloc] initWithFrame:CGRectMake(titleL.right+8, 0, 30, 30)];
        accountBtn.layer.masksToBounds = YES;
        accountBtn.layer.cornerRadius = 12.5;
        accountBtn.centerY = headV.centerY+6;
        [accountBtn setBackgroundImage:[UIImage imageNamed:@"加号2-fill"] forState:UIControlStateNormal];
        [accountBtn addTarget:self action:@selector(clickAcount) forControlEvents:UIControlEventTouchUpInside];
        [headV addSubview:accountBtn];

        
        UILabel  *longL = [[UILabel alloc] initWithFrame:CGRectMake(16, btn.bottom+12, SCREEN_WIDTH-32, 0.5)];
        longL.backgroundColor = [UIColor colorWithWhite:1 alpha:0.3];
        [headV addSubview:longL];
    
        UILabel *timeL = [[UILabel alloc] initWithFrame:CGRectMake(16, longL.bottom+12, 80, 16)];
        timeL.font = [UIFont systemFontOfSize:15];
        timeL.layer.masksToBounds = YES;
        timeL.layer.cornerRadius = 5;
        timeL.textColor = [UIColor whiteColor];
        timeL.text = dic[@"time"];
        
        [headV addSubview:timeL];
        
        if (section == 1) {
            
            headV.frame = CGRectMake(0, 0, SCREEN_WIDTH, 75);
            
        }else{
        
            btn.hidden = YES;
            titleL.hidden = YES;
            timeL.frame = CGRectMake(16, 8, 80, 25);
            longL.hidden = YES;
            accountBtn.hidden = YES;
        
        }
        
        return headV;

        
    }
    
    return nil;
    
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{

    if (section >1) {
        
        return 30;
    }else if(section == 1){
    
    
        return 75;
    }
        

    return 0.01;

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if(indexPath.section == 0){
    
        return 260;
    }else
        return 40;

}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{


    return 0.1;
}

-(UITableView *)tableView{

    if (!_tableView) {
        
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 54, SCREEN_WIDTH, SCREEN_HEIGHT-54) style:UITableViewStyleGrouped];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.backgroundColor = [UIColor clearColor];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    }
    return _tableView;

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    if ((-64<scrollView.contentOffset.y)&&(scrollView.contentOffset.y<0)){
        NSLog(@"scrollview did scroll %@ %f",NSStringFromCGPoint(scrollView.contentOffset), 1-(fabs(scrollView.contentOffset.y)/64));
        self.titlebar.alpha=1-(fabs(scrollView.contentOffset.y)/64);
    }
}

-(void)updateBill:(NSNotification *)nitifa{

    NSDictionary *info = [nitifa object];
    
    pages = [info[@"pages"] integerValue];

    [_tableView reloadData];

}



-(void)clickAcount{


    KeepAcountViewController *accountV = [[KeepAcountViewController alloc] init];
    
    [self presentViewController:accountV animated:YES completion:nil];


}

-(void)clickBtn{



}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
