// MXCustomView.m
//
// Copyright (c) 2015 Maxime Epain
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.

#import "MXCustomView.h"
#import "MXSegmentedPager.h"
#import "BillboardTableViewCell.h"
#import "HomeNewNopicCell.h"
#import "SDRefreshFooterView.h"
#import "NoDataPromptView.h"
#import "MJRefresh.h"

@interface MXCustomView () <MXPageProtocol, UITableViewDelegate, UITableViewDataSource>{

    int pageNo,totoalPages;
    NSMutableArray *arrlist;
    BOOL isPic;


}
@property (nonatomic, strong) UITableView *table1;
@property (nonatomic, strong) UITableView *table2;
@property (nonatomic, strong) SDRefreshFooterView *refreshOrganizationFooterView;
@end

@implementation MXCustomView

- (id)initWithFrame:(CGRect)frame type:(NSString *)type{
    
    
    if (self = [super initWithFrame:frame]) {
        
        _Type = type;
        self.table1.frame = (CGRect){
            .origin         = CGPointZero,
            .size.width     = self.frame.size.width ,
            .size.height    = self.frame.size.height
        };
        arrlist = [[NSMutableArray alloc] init];
        pageNo = 1;
     
        [self setupHeader];
        [self SearchGrpTableView];
        
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    

}

- (UITableView *)table1 {
    if (!_table1) {
        _table1 = [[UITableView alloc] init];
        _table1.delegate    = self;
        _table1.dataSource  = self;
        [self addSubview:_table1];
    }
    return _table1;
}

- (UITableView *)table2 {
    if (!_table2) {
        _table2 = [[UITableView alloc] init];
        _table2.delegate    = self;
        _table2.dataSource  = self;
        [self addSubview:_table2];
    }
    return _table2;
}

#pragma -mark <UITableViewDataSource>

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    
    return arrlist.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    if (!isPic) {

        return 82;
    }

    return 104;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (!isPic) {//无图片
    
        static NSString * CellIdentifier = @"HomeNewNopicCell";
        HomeNewNopicCell * cell = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
        }

        cell.titleL.text = [ arrlist[indexPath.row] objectForKey:@"Title"];
        cell.detailL.text = [ arrlist[indexPath.row] objectForKey:@"Description"];

        return cell;
        
    }

    static NSString * CellIdentifier = @"BillboardTableViewCell";
    BillboardTableViewCell * l = [tableView dequeueReusableHeaderFooterViewWithIdentifier:CellIdentifier];
    if (!l) {
        l = [[[NSBundle mainBundle] loadNibNamed:CellIdentifier owner:self options:nil] objectAtIndex:0];
    }

    NSURL *url = [NSURL URLWithString: [arrlist[indexPath.row] objectForKey:@"PicUrl"]];
    [l.image sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"默认图片"]];
    
    l.image.layer.masksToBounds = YES;
    l.image.layer.cornerRadius = 8;
    l.labContent.text=[ arrlist[indexPath.row] objectForKey:@"Title"];
    l.labDigest.text =[ arrlist[indexPath.row] objectForKey:@"Description"];
    if (indexPath.row == 0) {
        NSString * str=[ arrlist[indexPath.row] objectForKey:@"Title"];
       // NSLog(@"xxxxxxxx %@",str);
    }
    return l;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{


    if ([self.delegate respondsToSelector:@selector(MXcustom:didSelectRowAtIndexPath:)]) {
        
        [self.delegate MXcustom:self didSelectRowAtIndexPath:[arrlist objectAtIndex:indexPath.row]];
    }

}

#pragma mark <MXPageProtocol>

- (BOOL)segmentedPager:(MXSegmentedPager *)segmentedPager shouldScrollWithView:(UIView *)view {
    if (view == self.table2) {
        return NO;
    }
    return YES;
}


- (void)setupHeader
{
    
    _noDataPromptView = [[NoDataPromptView alloc] initWithFrame:CGRectMake(0, 0, self.top, SCREEN_HEIGHT) image:@"no_data_icon" prompt:@"暂无新闻信息！" blankType:BLANK_NO_CONTENT];
    _noDataPromptView.delegate = self;
    [self addSubview:_noDataPromptView];
    
    self.table1.mj_footer =[MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [self SearchGrpTableView];
    }];

    
//    _refreshOrganizationFooterView = [SDRefreshFooterView refreshView];
//    
//    [_refreshOrganizationFooterView addToScrollView:_table1];
//    
//    [_refreshOrganizationFooterView addTarget:self refreshAction:@selector(OrganizationfooterRefresh)];
}

//- (void)OrganizationfooterRefresh
//{
//    
//    [self SearchGrpTableView:pageNo];
//    
//}

-(void) SearchGrpTableView
{
    

    NSDictionary *map  = @{@"cityName":@"",@"pageNo":[NSString stringWithFormat:@"%d",pageNo],@"newsType":_Type};
    
    [DE serverCall:@"queryGuestNews" params:map callback:^(BOOL success, int code, NSString *desc, NSDictionary *data,NSDictionary*param) {
        
        
        [self.table1.mj_footer endRefreshing];
        if(success)
        {
//            if ([[data objectForKey:@"lastCity"] isEqualToString:@"all"]) {
//                
//                lastCity = @"湖南省";
//                
//            }else
//                lastCity = [param objectForKey:@"cityName"];
            
            
           
            totoalPages =[[data objectForKey:@"pageCount"] intValue];
            isPic = [[data objectForKey:@"isShowPic"] isEqualToString:@"true"];//展示图片
            NSArray *listTemp =[data objectForKey:@"articles"];
            
            //第一页就没有数据返回说明没有数据
            if(pageNo==1){
                arrlist = [[NSMutableArray alloc] initWithArray:listTemp];
                if(arrlist==nil ||arrlist.count==0){
                    //                        [noDataPromptView setPromptStr:@"无观看记录" blankType:BLANK_NO_CONTENT hidden:NO];
                }
            }else{
                [arrlist addObjectsFromArray:listTemp];
            }
            [self.table1 reloadData];
            
            //只要list有数据就把空白提示页面隐藏
            if(arrlist!=nil && arrlist.count>0){
                //                    noDataPromptView.hidden = YES;
            }
            
            //当前页数已经等于全部页数或者没有数据
            if(pageNo==totoalPages ||totoalPages==0){
                [self.table1.mj_footer endRefreshingWithNoMoreData];
            }else{
                pageNo++;
            }
        }else{
            
                //没数据就显示空白页面
                if(arrlist==nil ||arrlist.count==0){
                    
                        [_noDataPromptView setPromptStr:@"获取新闻信息失败！" blankType:BLANK_NO_SYSTEM_ERR hidden:NO];
                    
                    }else{
                            //加载更多就使用对话框提示
                            [self showPromptAlert:@"" message:@"加载更多新闻信息失败！" cancel:nil confrim:@"我知道了"];
                }
        }


    }];
}


-(void) showPromptAlert:(NSString*) title message:(NSString*)message cancel:(NSString*)cancel confrim:(NSString*) confirm{
    UIAlertView *alter = [[UIAlertView alloc] initWithTitle:title message:message delegate:self  cancelButtonTitle:cancel otherButtonTitles:confirm, nil];
    [alter show];
}

@end
