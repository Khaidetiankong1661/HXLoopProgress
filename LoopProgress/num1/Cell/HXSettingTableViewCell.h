//
//  HXSettingTableViewCell.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXSettingCellAdaperProtocol.h"


@interface HXSettingTableViewCell : UITableViewCell

/**
 实现了HXSettingCellAdaperProtocol 协议的数据
 */
@property(nonatomic,strong) id<HXSettingCellAdaperProtocol> data;


/**
 创建HXSettingTableViewCell

 @param tableView
 @return HXSettingTableViewCell实例
 */
+ (instancetype)creatTableViewCellWithTableView:(UITableView *)tableView;

@end
