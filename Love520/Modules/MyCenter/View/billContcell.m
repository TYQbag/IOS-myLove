//
//  billContcell.m
//  Love520
//
//  Created by 唐亚倩 on 17/6/26.
//  Copyright © 2017年 唐亚倩. All rights reserved.
//

#import "billContcell.h"
@import Charts.Swift;


@interface billContcell ()<ChartViewDelegate>{


    UILabel *payMoney;
    UILabel *incomeL;

}

@property (nonatomic, strong)  PieChartView *chartView;

@end
@implementation billContcell

-(id)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {

        
        [self initView];
    }
   
    return  self;
}


-(void)initView{

    
    UILabel *payL = [[UILabel alloc] initWithFrame:CGRectMake(8, 10, (SCREEN_WIDTH-16)/2, 15)];
    payL.text = @"本月支出(元)";
    payL.textColor = [UIColor whiteColor];
    payL.textAlignment = NSTextAlignmentCenter;
    payL.font = [UIFont systemFontOfSize:15];
    [self addSubview:payL];
    
    payMoney = [[UILabel alloc] initWithFrame:CGRectMake(8, payL.bottom+10, (SCREEN_WIDTH-16)/2-9, 20)];
    payMoney.textColor = [UIColor whiteColor];
     payMoney.textAlignment = NSTextAlignmentCenter;
    payMoney.font = [UIFont systemFontOfSize:15];
    [self addSubview:payMoney];
    
    
    UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(SCREEN_WIDTH/2, 10, 0.5, 22)];
    line.backgroundColor = [UIColor whiteColor];
    
    [self addSubview:line];
    
    UILabel *incoL = [[UILabel alloc] initWithFrame:CGRectMake(line.right+8, 10, (SCREEN_WIDTH-16)/2-10, 15)];
    incoL.text = @"本月收入(元)";
    incoL.textColor = [UIColor whiteColor];
    incoL.font = [UIFont systemFontOfSize:15];
     incoL.textAlignment = NSTextAlignmentCenter;
    [self addSubview:incoL];
    
    incomeL = [[UILabel alloc] initWithFrame:CGRectMake(line.right+8, incoL.bottom+10, (SCREEN_WIDTH-16)/2-10, 20)];
    incomeL.textColor = [UIColor whiteColor];
     incomeL.textAlignment = NSTextAlignmentCenter;
    incomeL.font = [UIFont systemFontOfSize:15];
    [self addSubview:incomeL];
    

    
    _chartView = [[PieChartView alloc] initWithFrame:CGRectMake(15, 60, SCREEN_WIDTH-30, 200)];
    [self.contentView addSubview:_chartView];

    [self setupPieChartView:_chartView];
    
    _chartView.delegate = self;
    
    ChartLegend *l = _chartView.legend;
    l.horizontalAlignment = ChartLegendHorizontalAlignmentRight;
    l.verticalAlignment = ChartLegendVerticalAlignmentTop;
    l.orientation = ChartLegendOrientationVertical;
    l.drawInside = NO;
    l.xEntrySpace = 7.0;
    l.yEntrySpace = 3.0;
    l.yOffset = 7.0;
    
    // entry label styling
    _chartView.entryLabelColor = UIColor.whiteColor;
    _chartView.entryLabelFont = [UIFont fontWithName:@"HelveticaNeue-Light" size:12.f];
    [_chartView setExtraOffsetsWithLeft:20.f top:0.f right:20.f bottom:0];
    
    
    [self setDataCount];
    
    [_chartView animateWithYAxisDuration:1.4 easingOption:ChartEasingOptionEaseOutBack];

}

- (void)setDataCount
{
    
    NSMutableArray *entries = [[NSMutableArray alloc] init];
    
    NSArray *arry = [_billData objectForKey:@"details"];
    
    double totelFee = [[_billData objectForKey:@"payAll"] doubleValue];

    for (int i = 0; i < arry.count; i++)
    {
        
        NSDictionary *dic= [arry objectAtIndex:i];
        
        double rates = [dic[@"money"] doubleValue]/totelFee;
        
        NSString *name = dic[@"name"];
        
        
        [entries addObject:[[PieChartDataEntry alloc] initWithValue:rates label:name icon: [UIImage imageNamed:@"icon"]]];
        
    }
    
    PieChartDataSet *dataSet = [[PieChartDataSet alloc] initWithValues:entries label:@""];
    dataSet.sliceSpace = 2.0;
    
    dataSet.drawIconsEnabled = NO;
    
    dataSet.sliceSpace = 2.0;
    dataSet.iconsOffset = CGPointMake(0, 40);
    
    // add a lot of colors
    
    NSMutableArray *colors = [[NSMutableArray alloc] init];
    [colors addObjectsFromArray:ChartColorTemplates.vordiplom];
    [colors addObjectsFromArray:ChartColorTemplates.joyful];
    [colors addObjectsFromArray:ChartColorTemplates.colorful];
    [colors addObjectsFromArray:ChartColorTemplates.liberty];
    [colors addObjectsFromArray:ChartColorTemplates.pastel];
    [colors addObject:[UIColor colorWithRed:51/255.f green:181/255.f blue:229/255.f alpha:1.f]];
    
    dataSet.colors = colors;
    dataSet.sliceSpace = 1;//相邻区块之间的间距
    dataSet.selectionShift = 5;//选中区块时, 放大的半径
    
    //    dataSet.valueLinePart1OffsetPercentage = 0.8;
    //    dataSet.valueLinePart1Length = 0.2;
    //    dataSet.valueLinePart2Length = 0.4;
    //    //dataSet.xValuePosition = PieChartValuePositionOutsideSlice;
    //    dataSet.yValuePosition = PieChartValuePositionOutsideSlice;
    //    dataSet.valueLinePart1OffsetPercentage = 0.5;//折线中第一段起始位置相对于区块的偏移量, 数值越大, 折线距离区块越远
    //    dataSet.valueLinePart1Length = 0.5;//折线中第一段长度占比
    //    dataSet.valueLinePart2Length = 0.4;//折线中第二段长度最大占比
    //    dataSet.valueLineWidth = 1;//折线的粗细
    //    dataSet.valueLineColor = [UIColor whiteColor];//折线颜色
    //    dataSet.sliceSpace = 1;//相邻区块之间的间距
    //    dataSet.selectionShift = 5;//选中区块时, 放大的半径
    //    dataSet.xValuePosition = PieChartValuePositionInsideSlice;//名称位置
    //    dataSet.yValuePosition = PieChartValuePositionOutsideSlice;//数据位置
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:dataSet];
    
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    [data setValueFormatter:[[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter]];
    [data setValueFont:[UIFont fontWithName:@"HelveticaNeue-Light" size:11.f]];
    [data setValueTextColor:[UIColor blackColor]];
    
    _chartView.data = data;
    [_chartView highlightValues:nil];
}



- (void)setupPieChartView:(PieChartView *)chartView
{
    chartView.usePercentValuesEnabled = YES;
    chartView.drawSlicesUnderHoleEnabled = NO;
    chartView.holeRadiusPercent = 0.58;
    chartView.transparentCircleRadiusPercent = 0.61;
    chartView.chartDescription.enabled = NO;
    [chartView setExtraOffsetsWithLeft:5.f top:10.f right:5.f bottom:5.f];
    
    chartView.drawCenterTextEnabled = YES;

    chartView.drawHoleEnabled = YES;
    chartView.rotationAngle = 0.0;
    chartView.rotationEnabled = YES;
    chartView.highlightPerTapEnabled = YES;
    
    
    chartView.legend.maxSizePercent = 1;//图例在饼状图中的大小占比, 这会影响图例的宽高
    chartView.legend.formToTextSpace = 5;//文本间隔
    chartView.legend.font = [UIFont systemFontOfSize:10];//字体大小
    chartView.legend.textColor = [UIColor whiteColor];//字体颜色
    chartView.legend.position = ChartLegendPositionBelowChartCenter;//图例在饼状图中的位置
    chartView.legend.form = ChartLegendFormCircle;//图示样式: 方形、线条、圆形
    chartView.legend.formSize = 12;//图示大小
    
    chartView.chartDescription.text = @"5月消费分布图";
    chartView.chartDescription.font = [UIFont systemFontOfSize:10];
    chartView.chartDescription.textColor =[UIColor whiteColor];
    chartView.chartDescription.textAlign = NSTextAlignmentCenter;
    
    
    
}

#pragma mark - ChartViewDelegate

- (void)chartValueSelected:(ChartViewBase * __nonnull)chartView entry:(ChartDataEntry * __nonnull)entry highlight:(ChartHighlight * __nonnull)highlight
{
    NSLog(@"chartValueSelected");
}

- (void)chartValueNothingSelected:(ChartViewBase * __nonnull)chartView
{
    NSLog(@"chartValueNothingSelected");
}


-(void)setModel:(NSDictionary *)billDic{

    
    
    _billData = billDic;
    
    payMoney.text = [NSString stringWithFormat:@"¥%@", billDic[@"payAll"]]  ;
    incomeL.text = [NSString stringWithFormat:@"¥%@", billDic[@"inCome"]]  ;

    
    NSMutableParagraphStyle *paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByTruncatingTail;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@月消费分布",_billData[@"mouth"]]];
    [centerText setAttributes:@{
                                NSFontAttributeName: [UIFont fontWithName:@"HelveticaNeue-Light" size:13.f],
                                NSParagraphStyleAttributeName: paragraphStyle
                                } range:NSMakeRange(0, centerText.length)];
    _chartView.centerAttributedText = centerText;

    
    [self setDataCount];

}

@end
