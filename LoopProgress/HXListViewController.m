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

@interface HXListViewController ()

@end

@implementation HXListViewController

- (NSMutableArray<NSMutableArray<HXSettingCellAdaper *> *> *)getDataSource
{
    NSMutableArray  *dataSource = [NSMutableArray array];

    //第一组
    NSMutableArray *group1 = [NSMutableArray array];
    HXListModel *model1 = [[HXListModel alloc] initWithIcon:@"InvestmentRecord" title:@"蒙层彩色渐进圆环" destClass:nil];
    model1.blockk = ^{
        HXProgressViewController *vc = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"HXProgressViewController"];
        [self.navigationController pushViewController:vc animated:YES];
    };
    HXSettingCellAdaper *adapter1 = [[HXListViewAdaper alloc] initWithData:model1];
    [group1 addObject:adapter1];

    //第二组
    NSMutableArray *group2 = [NSMutableArray array];
    HXListModel *model2 = [[HXListModel alloc]initWithIcon:@"myMoney" title:@"适配器cell" destClass:[HXSettingViewController class]];
    HXSettingCellAdaper *adapter2 = [[HXListViewAdaper alloc] initWithData:model2];
    [group2 addObject:adapter2];

    HXListModel *model3 =[[HXListModel alloc] initWithIcon:nil title:@"关于" destClass:[self class]];
    HXSettingCellAdaper *adapter3  = [[HXListViewAdaper alloc] initWithData:model3];
    [group2 addObject:adapter3];


    //第三组
    NSMutableArray *group3 = [NSMutableArray array];
    HXListModel *model31 =[[HXListModel alloc]initWithIcon:nil title:@"网关" destClass:nil];
    HXSettingCellAdaper *adapter31 = [[HXListViewAdaper alloc] initWithData:model31];
    [group3 addObject:adapter31];


    [dataSource addObject:group1];
    [dataSource addObject:group2];
    [dataSource addObject:group3];
    return dataSource;
}


#pragma mark ----lazy

//-(NSMutableArray *)dataSource{
//    if (!_dataSource) {
////        NSArray *array = @[[AIListModel initWithTitle:@"衰减动画" andTargetVC:[AIPop1ViewController class]],
////                           [AIListModel initWithTitle:@"弹簧动画" andTargetVC:[AIPopSpringAnimationViewController class]],
////                           [AIListModel initWithTitle:@"跑马灯效果" andTargetVC:[AIMarqueeViewController class]],
////                           [AIListModel initWithTitle:@"Pop缩放动画" andTargetVC:[AISpringScaleViewController class]],
////                           [AIListModel initWithTitle:@"防百度加载提示" andTargetVC:[AIBaiduLoadHUDViewController class]],
////                           [AIListModel initWithTitle:@"facebook辉光动画" andTargetVC:[AIShimmerViewController class]],
////                           [AIListModel initWithTitle:@"Gradinent转场动画" andTargetVC:[AICAGradientLayerViewController class]],
////                           [AIListModel initWithTitle:@"scrollViews视差效果" andTargetVC:[AIScrollImageViewController class]],
////                           [AIListModel initWithTitle:@"wellCome加载动画" andTargetVC:[AIWellComeLoadViewController class]],
////                           [AIListModel initWithTitle:@"多个按钮按照微博九宫格排布" andTargetVC:[AIButtonsViewController class]],
////                           [AIListModel initWithTitle:@"模仿qq图片浏览" andTargetVC:[AIPictureViewerViewController class]],
////                           [AIListModel initWithTitle:@"researchKit的lineChart" andTargetVC:[AIResearchLineChartViewController class]],
////                           [AIListModel initWithTitle:@"自定义模态转场动画" andTargetVC:[AIPresentCustomTransition class]],
////                           [AIListModel initWithTitle:@"心电图" andTargetVC:[AIBezierPathViewController class]],
////                           [AIListModel initWithTitle:@"Cell点击动画" andTargetVC:[AITableViewTapAnimationController class]],
////                           [AIListModel initWithTitle:@"设置页面" andTargetVC:[AISettingViewController class]],
////                           [AIListModel initWithTitle:@"登录页面" andTargetVC:[AILoginAnimationViewController class]],
////                           [AIListModel initWithTitle:@"天猫Loading" andTargetVC:[AITmallLoadingViewController class]],
////                           [AIListModel initWithTitle:@"多人游戏" andTargetVC:[AIMultiplayerViewController class]],
////                           [AIListModel initWithTitle:@"不规则按钮" andTargetVC:[AIIrregularityViewController class]],
////                           [AIListModel initWithTitle:@"自适应高度textView" andTargetVC:[AIAutoTextViewViewController class]],
////                           [AIListModel initWithTitle:@"模糊效果" andTargetVC:[AIBlurImageViewController class]],
////                           [AIListModel initWithTitle:@"音乐播放按钮" andTargetVC:[AIPlayMusicViewController class]],
////                           [AIListModel initWithTitle:@"航班信息" andTargetVC:[AIFlightInfoViewController class]],
////                           [AIListModel initWithTitle:@"包裹" andTargetVC:[AIPackingListViewController class]],
////                           [AIListModel initWithTitle:@"gradientLayer动画" andTargetVC:[AISlideToRevealViewController class]],
////                           [AIListModel initWithTitle:@"离散图" andTargetVC:[AIDiscreteViewController class]],
////                           [AIListModel initWithTitle:@"BeginnerCook" andTargetVC:[AIBeginnerCookViewController class]],
////                           [AIListModel initWithTitle:@"本地闹钟" andTargetVC:[AILocationClockViewController class]],
////                           [AIListModel initWithTitle:@"Twitter开场动画" andTargetVC:[AILogoRevealViewController class]],
////                           [AIListModel initWithTitle:@"画板" andTargetVC:[AIDoodleViewController class]],
////                           [AIListModel initWithTitle:@"下载按钮" andTargetVC:[AIDownloadButtonViewController class]],
////                           [AIListModel initWithTitle:@"officebuddy" andTargetVC:[AIContainerViewController class]],
////                           [AIListModel initWithTitle:@"折叠" andTargetVC:[AIFoldViewController class]],
////                           [AIListModel initWithTitle:@"类似Safari效果" andTargetVC:[AIImageGalleryViewController class]],
////                           [AIListModel initWithTitle:@"播放按钮 + loading" andTargetVC:[AIPlayerButtonViewController class]]
////                           ];
////
////        _dataSource = [NSMutableArray arrayWithCapacity:array.count];
////        for (int i = 0; i < array.count; i++) {
////            AIListModel *model = array[i];
////            model.index        = i+1;
////            [model createAttributedString];
////            [_dataSource addObject:model];
//        }
//    }
//    return _dataSource;
//}
//
//#pragma mark ----life cycle
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.title                 = @"😎";
//
//    self.navigationController.navigationBar.barTintColor   = [UIColor flatRedColor];
//    // LaunchImage
//    UIImageView *iconImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    iconImageView.image        = [AppleSystemService launchImage];
//    [self.view addSubview:iconImageView];
//
//    {
//        // Do animation
//        [UIView animateKeyframesWithDuration:1.f delay:1.f options:0 animations:^{
//            NSInteger index = arc4random();
//            switch (index % 2) {
//                case 0:
//                    iconImageView.ai_y  = KHeight;
//                    break;
//                case 1:
//                    iconImageView.scale = 1.2f;
//                    break;
//                default:
//                    break;
//            }
//
//            iconImageView.alpha = 0.f;
//
//        } completion:^(BOOL finished) {
//
//            [iconImageView removeFromSuperview];
//            [self setUI];
//        }];
//    }
//}
//-(void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//}
//
//#pragma mark ----UI
///**设置ui*/
//-(void)setUI{
//    self.tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, AINavgationBarH,MainSize.width , MainSize.height-AINavgationBarH)
//                                                 style:(UITableViewStylePlain)];
//    //去掉自带分割线
//    [_tableView setSeparatorStyle:(UITableViewCellSeparatorStyleNone)];
//    [self.view addSubview:self.tableView];
//    self.tableView.delegate = self;
//    self.tableView.dataSource = self;
//
//
//    [GCDQueue executeInMainQueue:^{
//        // Load data.
//        NSMutableArray *indexPaths = [NSMutableArray array];
//        for (int i = 0; i < self.dataSource.count; i++) {
//
//            [indexPaths addObject:[NSIndexPath indexPathForItem:i inSection:0]];
//        }
//        self.tableViewLoadData = YES;
//        [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationFade];
//    } afterDelaySecs:0.25f];
//}
//
//#pragma mark -UITableViewDelegate
//
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    // 立即取消选中
//    [self.tableView deselectRowAtIndexPath:indexPath animated:YES];
//    AIListModel *model             = self.dataSource[indexPath.row];
//    AIBaseViewController *targetVC = [[model.targetVC alloc]init];
//    targetVC.title                 = model.title;
//    [self.navigationController pushViewController:targetVC  animated:YES];
//}
//
//#pragma mark -UITableViewDataSource
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
//    return self.isTableViewLoadData ? self.dataSource.count:0;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//    AIListTableViewCell *cell = [AIListTableViewCell createTableViewCellWithTableView:tableView];
//    cell.indexPath            = indexPath;
//    cell.model                = self.dataSource[indexPath.row];
//    return cell;
//}

@end
