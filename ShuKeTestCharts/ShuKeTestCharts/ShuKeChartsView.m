//
//  ShuKeChartsView.m
//  ShuKeTestCharts
//
//  Created by ShuKe on 2019/7/30.
//  Copyright © 2019 Da魔王_舒克. All rights reserved.
//

#import "ShuKeChartsView.h"

// 获取屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

@implementation ShuKeChartsView

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self createView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView
{
    self.backgroundColor = [UIColor whiteColor];
    [self addSubview:self.pieChartView];
}

- (PieChartView *)pieChartView
{
    if (!_pieChartView) {
        
        _pieChartView = [[PieChartView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 300)];
        _pieChartView.backgroundColor = [UIColor whiteColor];
        
        [_pieChartView setExtraOffsetsWithLeft:30 top:0 right:30 bottom:0]; // 饼状图距离边缘的间隙
        _pieChartView.usePercentValuesEnabled = YES; // 是否根据所提供的数据, 将显示数据转换为百分比格式
        _pieChartView.dragDecelerationEnabled = YES; // 拖拽饼状图后是否有惯性效果
        _pieChartView.drawEntryLabelsEnabled = YES; // 是否显示区块文本
        
        _pieChartView.drawHoleEnabled = YES; // 饼状图是否是空心
        _pieChartView.holeRadiusPercent = 0.5; // 空心半径占比
        _pieChartView.holeColor = [UIColor clearColor]; // 空心颜色
        _pieChartView.transparentCircleRadiusPercent = 0.52; // 半透明空心半径占比
        _pieChartView.transparentCircleColor = [UIColor colorWithRed:210/255.0 green:145/255.0 blue:165/255.0 alpha:0.3]; // 半透明空心的颜色
        
        if (_pieChartView.isDrawHoleEnabled == YES) {
            _pieChartView.drawCenterTextEnabled = NO; // 是否显示中间文字
            // 普通文本
//            _pieChartView.centerText = @""; // 中间文字
            
            // 富文本
//            NSMutableAttributedString *centerText = [[NSMutableAttributedString alloc] initWithString:@"饼状图"];
//            [centerText setAttributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],
//                                        NSForegroundColorAttributeName: [UIColor orangeColor]}
//                                range:NSMakeRange(0, centerText.length)];
//            _pieChartView.centerAttributedText = centerText;
        }
        
        _pieChartView.legend.maxSizePercent = 1; // 图例在饼状图中的大小占比, 这会影响图例的宽高
        _pieChartView.legend.formToTextSpace = 5; // 文本间隔
        _pieChartView.legend.font = [UIFont systemFontOfSize:10]; // 字体大小
        _pieChartView.legend.textColor = [UIColor grayColor]; // 字体颜色
        _pieChartView.legend.form = ChartLegendFormCircle; // 图示样式: 方形、线条、圆形
        _pieChartView.legend.formSize = 12; // 图示大小
        
    }
    return _pieChartView;
}

- (void)updateDataWithDatas:(NSArray *)datas WithTitles:(NSArray *)titles WithSetColors:(NSArray *)setColors WithSetValueColors:(NSArray *)setValueColors
{
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i < datas.count; i++) {
        PieChartDataEntry *entry = [[PieChartDataEntry alloc] initWithValue:[datas[i] integerValue] label:titles[i]];
        [array addObject:entry];
    }
    
    PieChartDataSet *set = [[PieChartDataSet alloc] initWithEntries:array label:@""];
    
    // 颜色(每个扇形区域可以单独设置颜色)
//    set.colors = @[UIColor.blueColor,UIColor.redColor,UIColor.greenColor];
    set.colors = setColors;
    
    set.entryLabelFont = [UIFont systemFontOfSize:0];
    set.entryLabelColor = [UIColor blackColor];
    set.drawIconsEnabled = NO;
    // 当饼状图带折线时，dataSet.yValuePosition 数值的位置只有设置为PieChartValuePositionOutsideSlice，折线才会显示，valueLine相关属性才有用
    set.drawValuesEnabled = YES; // 是否在拐点处显示数据
    set.valueFont = [UIFont systemFontOfSize:12];
//    set.valueColors = @[UIColor.blueColor,UIColor.redColor,UIColor.greenColor];
    set.valueColors = setValueColors;
//    set.xValuePosition = PieChartValuePositionInsideSlice; // 名称位置
    set.yValuePosition = PieChartValuePositionOutsideSlice; // 数据位置
//    set.valueLineColor = UIColor.orangeColor;
    set.valueLineColor = UIColor.brownColor; // 折线颜色
    
    // 格式化
    NSNumberFormatter *pFormatter = [[NSNumberFormatter alloc] init];
    pFormatter.numberStyle = NSNumberFormatterPercentStyle;
    pFormatter.maximumFractionDigits = 1;
    pFormatter.multiplier = @1.f;
    pFormatter.percentSymbol = @" %";
    set.valueFormatter = [[ChartDefaultValueFormatter alloc] initWithFormatter:pFormatter];
    
    // 相邻区块之间的间距
    set.sliceSpace = 0;
    // 扇形区域放大范围
    set.selectionShift = 3;
    // 动画开始的角度
    
    PieChartData *data = [[PieChartData alloc] initWithDataSet:set];
    
    self.pieChartView.data = data;
    // 动画开启
    [self.pieChartView animateWithXAxisDuration:2.0f easingOption:ChartEasingOptionEaseOutExpo];
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
