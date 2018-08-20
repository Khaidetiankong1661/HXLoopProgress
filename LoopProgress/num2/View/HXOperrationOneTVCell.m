//
//  HXOperrationOneTVCell.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXOperrationOneTVCell.h"
#import "FactoryOneModel.h"

@interface HXOperrationOneTVCell()

@property (weak, nonatomic) IBOutlet UIImageView *imageVi;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

@end

@implementation HXOperrationOneTVCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setNewModel:(FactoryModel *)model
{
    FactoryOneModel *oneModel = (FactoryOneModel *)model;
    NSString *imgstr = [oneModel img];
    self.imageVi.image = [UIImage imageNamed:imgstr];

    NSString *titleStr = [oneModel title];
    self.titleLabel.text = titleStr;
}

@end
