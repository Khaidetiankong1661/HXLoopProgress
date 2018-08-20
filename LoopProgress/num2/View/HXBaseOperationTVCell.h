//
//  HXBaseOperationTVCell.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FactoryModel.h"

@interface HXBaseOperationTVCell : UITableViewCell

@property (nonatomic, strong) FactoryModel *model;

- (void)setNewModel:(FactoryModel *)model;

@end
