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

@interface HXSettingViewController ()

@property (nonatomic, strong) UIImageView *imagevv;

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
    HXSettingModel *model1 = [[HXSettingModel alloc]initWithIcon:@"calendar" title:@"钱包" destClass:[self class] andAccessibilityView:self.imagevv];
    HXSettingCellAdaper *adapter1 = [[HXSettingModelAdaper alloc]initWithData:model1];
    [group1 addObject:adapter1];


    //第二组
    NSMutableArray *group2 = [NSMutableArray array];
    UISwitch *switchBtn = [[UISwitch alloc]init];
    [switchBtn addTarget:self action:@selector(onClickSwitch) forControlEvents:(UIControlEventTouchUpInside)];
    HXSettingModel *model2 = [[HXSettingModel alloc]initWithIcon:@"myPrize" title:@"场景" destClass:nil andAccessibilityView:switchBtn];
    HXSettingCellAdaper *adapter2 = [[HXSettingModelAdaper alloc]initWithData:model2];
    [group2 addObject:adapter2];

    HXSettingModel *model3 =[[HXSettingModel alloc]initWithIcon:@"InvestmentRecord" title:@"关于" destClass:[self class] andAccessibilityView:self.imagevv];
    [model3 setBlock:^{
        NSLog(@"点击关于");
    }];
    HXSettingCellAdaper *adapter3  = [[HXSettingModelAdaper alloc]initWithData:model3];
    [group2 addObject:adapter3];


    //第三组
    NSMutableArray *group3 = [NSMutableArray array];
    HXSettingModel *model31 =[[HXSettingModel alloc]initWithIcon:@"wangguan" title:@"网关" destClass:nil andAccessibilityView:nil];

    HXSettingCellAdaper *adapter31 = [[HXSettingModelAdaper alloc]initWithData:model31];
    [group3 addObject:adapter31];

    
    [dataSource addObject:group1];
    [dataSource addObject:group2];
    [dataSource addObject:group3];
    return dataSource;
}


#pragma mark --Action
- (void)onClickSwitch
{

}

- (UIImageView *)imagevv
{
//    if (!_imagevv) {

    UIImageView *imageiew  = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"rightArrow"]];
    imageiew.frame = CGRectMake(0, 0, 10, 20);
    imageiew.contentMode = UIViewContentModeScaleAspectFit;
    _imagevv = imageiew;
//    }
    return _imagevv;
}

@end
