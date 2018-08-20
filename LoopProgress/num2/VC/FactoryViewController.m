//
//  FactoryViewController.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//
/*
 工厂模式是我们最常用的实例化对象模式了，是用工厂方法代替new操作的一种模式。著名的Jive论坛 ,就大量使用了工厂模式，工厂模式在Java程序系统可以说是随处可见。因为工厂模式就相当于创建实例对象的new，我们经常要根据类Class生成实例对象，如A a=new A() 工厂模式也是用来创建实例对象的，所以以后new时就要多个心眼，是否可以考虑使用工厂模式，虽然这样做，可能多做一些工作，但会给你系统带来更大的可扩展性和尽量少的修改量。---百度百科

 设计优势的体现:
 一个工厂满足所有要求, 不需要创建过多相似的类 简化了编程,方便程序员开发;因为很多类名不用记了,这也是面向对象
 编程的集中体现

 通过上面的分析，我们大致可以总结出工厂这种设计模式的应用场景：

 （1）当一个类并不知道要创建的具体对象是什么，交由子类处理

 （2）当一些类有相似的行为和结构，只是具体实现不同时，可以抽象出工厂

 （3）使用者并不在乎具体类型，只在乎接口约定的行为，并且这种行为有个体差异
 */

#import "FactoryViewController.h"
#import "HXBaseOperationTVCell.h"
#import "FactoryModel.h"

@interface FactoryViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray *dataArr;

@property (nonatomic, strong) UITableView *tableView;

@end

@implementation FactoryViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    self.title =  @"抽象工厂模式";

    [self.view addSubview:self.tableView];
    [self addData];
}

- (void)addData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"plist"];
    NSArray *array = [NSArray arrayWithContentsOfFile:path];

    for (NSDictionary *dic in array) {

        FactoryModel *model = [FactoryModel initWithDictionary:dic];
        [self.dataArr addObject:model];
    }
    [self.tableView reloadData];
}

#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (self.dataArr.count <= 0) return 0;
    return self.dataArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FactoryModel *model = self.dataArr[indexPath.row];
    HXBaseOperationTVCell *cell = [model createProductWithTableView:tableView];
    if (!model) return cell;

    [cell setNewModel:model];
    return cell;
}



#pragma mark --UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
//    [tableView deselectRowAtIndexPath:indexPath animated:YES];

//    HXSettingCellAdaper *cellAdapter = self.dataArr[indexPath.section][indexPath.row];
//
//    if (cellAdapter.destVC) {//如果有目标控制器
//
//        [self.navigationController pushViewController:[[cellAdapter.destVC alloc]init] animated:YES];
//    } else if (cellAdapter.optionBlock){
//
//        cellAdapter.optionBlock();
//    }
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
        _tableView.rowHeight = 100;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tap:)];
        tap.cancelsTouchesInView = NO;
        [_tableView addGestureRecognizer:tap];
    }
    return _tableView;
}

- (NSMutableArray *)dataArr
{
    if (!_dataArr) {
        _dataArr = [NSMutableArray array];
    }
    return _dataArr;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
