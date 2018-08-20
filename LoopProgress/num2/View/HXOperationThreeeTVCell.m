//
//  HXOperationThreeeTVCell.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXOperationThreeeTVCell.h"
#import "FactoryThreeModel.h"

@interface HXOperationThreeeTVCell()

@property (weak, nonatomic) IBOutlet UILabel *rightLabel;

@property (weak, nonatomic) IBOutlet UILabel *leftLabel;

@end

@implementation HXOperationThreeeTVCell

- (void)setNewModel:(FactoryModel *)model
{

    FactoryThreeModel *threeModel = (FactoryThreeModel *)model;

    NSString *titleStr = [threeModel title];
    self.rightLabel.text = titleStr;

    NSString *detialStr = [threeModel detail];
    self.leftLabel.text = detialStr;
}

@end
