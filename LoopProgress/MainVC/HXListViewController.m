//
//  HXListViewController.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXListViewController.h"
#import "HXListModel.h"
#import "HXListViewAdaper.h"
#import "HXSettingCellAdaper.h"
#import "HXProgressViewController.h"
#import "HXSettingViewController.h"
#import "FactoryViewController.h"

@interface HXListViewController ()

@end

@implementation HXListViewController

- (NSMutableArray<NSMutableArray<HXSettingCellAdaper *> *> *)getDataSource
{
    // section0
    NSMutableArray *arr1 = [NSMutableArray array];
    HXListModel *model1 = [[HXListModel alloc] initWithIcon:@"InvestmentRecord" title:@"蒙层彩色渐进圆环" destClass:nil];
    model1.blockk = ^{
        HXProgressViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HXProgressViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    };
    HXSettingCellAdaper *adapter1 = [[HXListViewAdaper alloc] initWithData:model1];
    [arr1 addObject:adapter1];

    // section1
    NSMutableArray *arr2 = [NSMutableArray array];
    HXListModel *model2 = [[HXListModel alloc]initWithIcon:@"myMoney" title:@"适配器模式案例之cell体现" destClass:[HXSettingViewController class]];
    HXSettingCellAdaper *adapter2 = [[HXListViewAdaper alloc] initWithData:model2];

    HXListModel *model21 = [[HXListModel alloc]initWithIcon:@"myMoney" title:@"工厂模式案例之cell体现" destClass:[FactoryViewController class]];
    HXSettingCellAdaper *adapter21 = [[HXListViewAdaper alloc] initWithData:model21];
    [arr2 addObject:adapter2];
    [arr2 addObject:adapter21];

    // section2
    NSMutableArray *arr3 = [NSMutableArray array];
    HXListModel *model3 =[[HXListModel alloc] initWithIcon:@"" title:@"关于" destClass:[self class]];
    HXSettingCellAdaper *adapter3  = [[HXListViewAdaper alloc] initWithData:model3];
    [arr3 addObject:adapter3];

    // section3
    NSMutableArray *arr4 = [NSMutableArray array];
    HXListModel *model31 =[[HXListModel alloc]initWithIcon:@"" title:@"网关" destClass:nil];
    HXSettingCellAdaper *adapter4 = [[HXListViewAdaper alloc] initWithData:model31];
    [arr4 addObject:adapter4];


//    NSMutableArray *group = [NSMutableArray arrayWithObjects:arr1, arr2, arr3, arr4, nil];
    NSMutableArray *dataSource = [NSMutableArray arrayWithObjects:arr1, arr2, arr3, arr4, nil];

    return dataSource;
}

@end
