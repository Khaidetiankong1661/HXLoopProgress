//
//  HXOperationTwoTVCell.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXOperationTwoTVCell.h"

@interface HXOperationTwoTVCell()

@property (weak, nonatomic) IBOutlet UILabel *tilteLabel;

@end

@implementation HXOperationTwoTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setNewModel:(FactoryModel *)model
{
    NSString *titleStr = [model title];
    self.tilteLabel.text = titleStr;
}
@end
