//
//  HXSettingViewController.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXSettingViewController.h"
#import "HXSettingModel.h"
#import "HXSettingModelAdaper.h"
#import "HXSettingCellAdaper.h"
#import "HXIamgeView.h"
#import "HXNumberButView.h"

@interface HXSettingViewController ()


@end

@implementation HXSettingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title = @"适配器";
}

- (NSMutableArray<NSMutableArray<HXSettingCellAdaper *> *> *)getDataSource
{
    NSMutableArray  *dataSource = [NSMutableArray array];

    //第一组
    NSMutableArray *group1 = [NSMutableArray array];
    HXSettingModel *model1 = [[HXSettingModel alloc]initWithIcon:@"calendar" title:@"钱包" destClass:[self class] andAccessibilityView:[HXIamgeView imageVie]];
    HXSettingCellAdaper *adapter1 = [[HXSettingModelAdaper alloc]initWithData:model1];
    [group1 addObject:adapter1];


    //第二组
    NSMutableArray *group2 = [NSMutableArray array];
    UISwitch *switchBtn = [[UISwitch alloc]init];
    [switchBtn addTarget:self action:@selector(onClickSwitch) forControlEvents:(UIControlEventTouchUpInside)];
    HXSettingModel *model2 = [[HXSettingModel alloc]initWithIcon:@"myPrize" title:@"场景" destClass:nil andAccessibilityView:switchBtn];
    HXSettingCellAdaper *adapter2 = [[HXSettingModelAdaper alloc]initWithData:model2];
    [group2 addObject:adapter2];

    HXSettingModel *model3 =[[HXSettingModel alloc]initWithIcon:@"InvestmentRecord" title:@"关于" destClass:[self class] andAccessibilityView:[HXIamgeView imageVie]];
    [model3 setBlock:^{
        NSLog(@"点击关于");
    }];
    HXSettingCellAdaper *adapter3  = [[HXSettingModelAdaper alloc]initWithData:model3];
    [group2 addObject:adapter3];


    //第三组
    NSMutableArray *group3 = [NSMutableArray array];
    HXNumberButView *number = [[HXNumberButView alloc]init];
    HXSettingModel *model31 =[[HXSettingModel alloc]initWithIcon:@"" title:@"网关" destClass:nil andAccessibilityView:number];

    HXSettingCellAdaper *adapter31 = [[HXSettingModelAdaper alloc]initWithData:model31];
    [group3 addObject:adapter31];

    
    //第四组
    NSMutableArray *group4 = [NSMutableArray array];
    HXSettingModel *model4 =[[HXSettingModel alloc]initWithIcon:@"wangguan" title:@"部句" destClass:nil andAccessibilityView:nil];

    HXSettingCellAdaper *adapter4 = [[HXSettingModelAdaper alloc]initWithData:model4];
    [group4 addObject:adapter4];
    
    [dataSource addObject:group1];
    [dataSource addObject:group2];
    [dataSource addObject:group3];
    [dataSource addObject:group4];
    return dataSource;
}


#pragma mark --Action
- (void)onClickSwitch
{

}

@end
