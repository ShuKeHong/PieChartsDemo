//
//  ShuKeChartsView.h
//  ShuKeTestCharts
//
//  Created by ShuKe on 2019/7/30.
//  Copyright © 2019 Da魔王_舒克. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShuKeTestCharts-Bridging-Header.h"
#import "ShuKeTestCharts-Swift.h"

NS_ASSUME_NONNULL_BEGIN

@interface ShuKeChartsView : UIView

@property (nonatomic, strong) PieChartView *pieChartView;

/*
 * 更新数据
 *   parameter
 *     datas : 每个扇形区域的数额
 *     titles : 每个扇形区域的名称
 *     setColors : 每个扇形区域的颜色
 *     setValueColors : 每个扇形区域的字颜色
 */
- (void)updateDataWithDatas:(NSArray *)datas
                 WithTitles:(NSArray *)titles
              WithSetColors:(NSArray *)setColors
         WithSetValueColors:(NSArray *)setValueColors;

@end

NS_ASSUME_NONNULL_END
