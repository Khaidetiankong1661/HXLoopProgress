//
//  AdapterViewController.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
/*
 适配器 :
 将一个类的接口转换成客户希望的另外一个接口。Adapter 模式使得原本由于接口不兼容而不能一起工作的那些类可以一起工作。
 适用场景：
 1、已经存在的类的接口不符合我们的需求；
 2、创建一个可以复用的类，使得该类可以与其他不相关的类或不可预见的类（即那些接口可能不一定兼容的类）协同工作；
 3、在不对每一个都进行子类化以匹配它们的接口的情况下，使用一些已经存在的子类。
 */

#import "AdapterViewController.h"
#import "HXSettingTableViewCell.h"

@interface AdapterViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<NSMutableArray<HXSettingCellAdaper*> *> *dataArr;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation AdapterViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.view addSubview:self.tableView];
}


#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    if (self.dataArr.count <= 0) return 0;
    return self.dataArr.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArr.count <= 0) return 0;
    return self.dataArr[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HXSettingTableViewCell *cell = [HXSettingTableViewCell creatTableViewCellWithTableView:tableView];

    if (self.dataArr.count > 0) {

        HXSettingCellAdaper *modelAdper = self.dataArr[indexPath.section][indexPath.row];
        cell.data = modelAdper;
    }
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 8;
}

- (CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.section == 0 ? 55:52;
}



#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    HXSettingCellAdaper *cellAdapter = self.dataArr[indexPath.section][indexPath.row];

    if (cellAdapter.destVC) {//如果有目标控制器

        [self.navigationController pushViewController:[[cellAdapter.destVC alloc]init] animated:YES];
    } else if (cellAdapter.optionBlock){

        cellAdapter.optionBlock();
    }
}



#pragma mark - Action
- (void)onClickSwitch
{
    NSLog(@"点击switch");
}

- (void)tap:(UITapGestureRecognizer*)tap
{
    [self.view endEditing:YES];
}



#pragma mark - lazy
- (UITableView *)tableView
{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenSize.width, ScreenSize.height) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor colorWithRed:250.0/255.0f green:250.0/255.0f blue:250.0/255.0f alpha:1.0];
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        //添加收键盘手势
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tap.cancelsTouchesInView = NO;
        [_tableView addGestureRecognizer:tap];
    }
    return _tableView;
}

- (NSMutableArray<NSMutableArray<HXSettingCellAdaper *> *> *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray arrayWithArray:[self getDataSource]];
    }
    return _dataArr;
}

- (NSMutableArray <NSMutableArray<HXSettingCellAdaper*> *>*)getDataSource
{
    return nil;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
