//
//  DetailInfoViewController.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/5.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "DetailInfoViewController.h"
#import "UIImageView+LBBlurredImage.h"
#import "ZLPhotoPickerBrowserViewController.h"

@interface DetailInfoViewController ()<UITableViewDelegate,UITableViewDataSource>{


    UIView *vis;
    UILabel *  lableTitle;

}

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UIImageView *partImgV;

@property (nonatomic, strong) UIImageView *userHeadImgV;
@property (nonatomic, strong) UILabel *userName;



@end

@implementation DetailInfoViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    [self.view addSubview:self.tableView];
    _tableView.tableHeaderView = [self getHeadview];
    
    [self.view addSubview:[self getNavView]];
    
    [self.view bringSubviewToFront:vis];

    
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    
    if (!cell) {
        
        cell  =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    cell.backgroundColor = [UIColor clearColor];
    
    cell.textLabel.text = @"伴侣配对";
    
    return cell;
    
    
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 1;
}


-(UIView *)getHeadview{

    UIView *headView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 270)];
    headView.contentMode = UIViewContentModeScaleToFill;
    
    [headView addSubview:self.titlebar];
    self.titlebar.backgroundColor = [UIColor clearColor];
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 170)];
    _imageView.userInteractionEnabled = YES;
    _imageView.image = [UIImage imageNamed:@"green"];
    _imageView.userInteractionEnabled = YES;
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickBackImg:)];
    [_imageView addGestureRecognizer:gesture] ;
    
    _userName = [[UILabel alloc] initWithFrame:CGRectMake(16, 180, 100, 15)];
    _userName.text  = @"想";
    _userName.font = [UIFont systemFontOfSize:16];
    _userName.textColor = [UIColor grayColor];
    [headView addSubview:_userName];
    
    
    UIImageView *medal = [[UIImageView alloc] initWithFrame:CGRectMake(SCREEN_WIDTH-40, 180, 20, 20)];
    medal.image = [UIImage imageNamed:@"crown1"];
    medal.layer.masksToBounds = YES;
    medal.layer.cornerRadius = 10;
    [headView addSubview:medal];
    
    UILabel *medaL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30, 13)];
    medaL.text = @"金婚";
    medaL.textColor = [UIColor whiteColor];
    medaL.textAlignment = NSTextAlignmentCenter;
    medaL.font = [UIFont systemFontOfSize:10];
    medaL.centerX = medal.centerX;
    medaL.top = medal.bottom+3;
    [headView addSubview:medaL];
    
    [headView addSubview:_imageView];
    
    _userHeadImgV = [[UIImageView alloc] initWithFrame:CGRectMake((SCREEN_WIDTH-100)/2, 110, 100, 100)];
    _userHeadImgV.userInteractionEnabled = YES;
    _userHeadImgV.layer.masksToBounds = YES;
    _userHeadImgV.layer.cornerRadius = 50;
    _userHeadImgV.userInteractionEnabled = YES;
    _userHeadImgV.image = [UIImage imageNamed:@"psb-21"];
    [headView addSubview:_userHeadImgV];
    
    UITapGestureRecognizer *gestureHead = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickHeadImg:)];
    [_userHeadImgV addGestureRecognizer:gestureHead] ;
    
    UILabel *myText = [[UILabel alloc] initWithFrame:CGRectMake(35, _userHeadImgV.bottom +20, SCREEN_WIDTH-70, 15)];
    myText.backgroundColor = [UIColor clearColor];
    myText.font = [UIFont systemFontOfSize:13];
    myText.text = @"说分手说了好几年了，现在还没分，我被劫持了！！！";
    myText.textColor = [UIColor whiteColor];
    [headView addSubview:myText];
    
    return headView;

}

-(UIView *)getNavView{

    vis = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 64)];
    vis.backgroundColor = [UIColor colorWithHex:0x8B4513 alpha:0];
    
    lableTitle = [[UILabel alloc]initWithFrame:CGRectMake(40.0f, 20, SCREEN_WIDTH-80, 40)];
    lableTitle.text = @"我的资料";
    lableTitle.textAlignment = NSTextAlignmentCenter;
    lableTitle.textColor = [UIColor whiteColor];
    lableTitle.backgroundColor = [UIColor clearColor];
    lableTitle.font = [UIFont systemFontOfSize:20.0];
    lableTitle.textColor = [UIColor colorWithWhite:1 alpha:0];
    [vis addSubview:lableTitle];
    
    UIButton *btnBack = [UIButton buttonWithType:UIButtonTypeCustom];
    btnBack.frame = CGRectMake(10.0f, (20)+4, 25.0f, 30.0f);
    [btnBack setImage: [UIImage imageNamed:@"icon_leftArrow_white.png"] forState:UIControlStateNormal];
    [btnBack addTarget:self action:@selector(clickback) forControlEvents:UIControlEventTouchUpInside];
    [vis addSubview:btnBack];
    
    return vis;

}

-(UITableView *)tableView{
    
    if (!_tableView) {
        
        _tableView  = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStylePlain];
        _tableView.dataSource = self;
        _tableView.delegate = self;
        _tableView.rowHeight = 40;
        [_tableView setSeparatorStyle:UITableViewCellSeparatorStyleNone];
        _tableView.backgroundColor = [UIColor clearColor];
        
    }
    return _tableView;
    
}


-(void)clickHeadImg:(UIGestureRecognizer *)gesture{
    
    
    ZLPhotoPickerBrowserViewController *viewC = [[ZLPhotoPickerBrowserViewController alloc] init];
    
    [viewC showHeadPortrait:_userHeadImgV];

}

-(void)clickBackImg:(UIGestureRecognizer *)gesture{


    ZLPhotoPickerBrowserViewController *viewC = [[ZLPhotoPickerBrowserViewController alloc] init];
    
    [viewC showHeadPortrait:_imageView];

}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat width = self.view.frame.size.width;// 图片的宽度
    CGFloat yOffset = scrollView.contentOffset.y;// 偏移的y值

    if (yOffset < 0) {
        CGFloat totalOffset = 170 + ABS(yOffset);
        CGFloat f = totalOffset / 170;
        _imageView.frame = CGRectMake(- (width * f - width) / 2, yOffset, width * f, totalOffset);// 拉伸后的图片的frame应该是同比例缩放

    }

    
    if ((scrollView.contentOffset.y>0)){
 
        NSLog(@"****%f",fabs(scrollView.contentOffset.y)/64);
        
        vis.backgroundColor = [UIColor colorWithHex:0x8B4513 alpha:(fabs(scrollView.contentOffset.y)/64)];
        lableTitle.textColor = [UIColor colorWithWhite:1 alpha:(fabs(scrollView.contentOffset.y)/64)];
    }else{
    
        vis.backgroundColor = [UIColor colorWithHex:0x8B4513 alpha:0];
        lableTitle.textColor = [UIColor colorWithWhite:1 alpha:0];
    }
        

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickback{
    
    
    [kAppDelegate.rootNav popViewControllerAnimated:YES];
    
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
