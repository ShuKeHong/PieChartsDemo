//
//  ViewController.m
//  ShuKeTestCharts
//
//  Created by ShuKe on 2019/7/30.
//  Copyright © 2019 Da魔王_舒克. All rights reserved.
//

#import "ViewController.h"

// 获取屏幕宽度
#define ScreenWidth [UIScreen mainScreen].bounds.size.width

// 16进制颜色
#define HEX_COLOR(hexValue) [UIColor colorWithRed:((float)((hexValue & 0xFF0000) >> 16)) / 255.0 green:((float)((hexValue & 0xFF00) >> 8)) / 255.0 blue:((float)(hexValue & 0xFF)) / 255.0 alpha:1.0f]

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.chartsView];
    
    [self.chartsView updateDataWithDatas:@[@"100",@"50",@"30"]
                              WithTitles:@[@"费用1",@"费用2",@"费用3"]
                           WithSetColors:@[HEX_COLOR(0x3366FF),HEX_COLOR(0xFF0000),HEX_COLOR(0x66FF66)]
                      WithSetValueColors:@[HEX_COLOR(0x3366FF),HEX_COLOR(0xFF0000),HEX_COLOR(0x66FF66)]];
    
    
}

- (ShuKeChartsView *)chartsView
{
    if (!_chartsView) {
        _chartsView = [[ShuKeChartsView alloc]initWithFrame:CGRectMake(0, 100, ScreenWidth, 300)];
    }
    return _chartsView;
}


@end
