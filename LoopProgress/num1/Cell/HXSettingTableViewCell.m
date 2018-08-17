//
//  HXSettingTableViewCell.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXSettingTableViewCell.h"
#import "UIColor+Tool.h"

@interface HXSettingTableViewCell()

//  图标
@property (weak,nonatomic) UIImageView *iconImageView;

//  标签label
@property (weak,nonatomic) UILabel *tipsLabel;

//  分割线
@property (weak,nonatomic) UIView *lineView;

//  要执行的block
@property (nonatomic,copy) OptionBlock optionBlock;

//  目标控制器
@property(nonatomic,strong) Class destVC;

@end

@implementation HXSettingTableViewCell

+ (instancetype)creatTableViewCellWithTableView:(UITableView *)tableView
{
    static NSString *identifier = @"HXSettingTableViewCellIdentifier";

    HXSettingTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];

    if (!cell) {
        cell = [[HXSettingTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }

    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];

    //图片
    UIImageView *imageView = [[UIImageView alloc]init];
    imageView.contentMode = UIViewContentModeScaleAspectFit;
    self.iconImageView     = imageView;
    [self.contentView addSubview:imageView];
    //label
    UILabel *label         = [[UILabel alloc]init];
    label.textColor        = [UIColor colorWithHexString:@"#353535"];
    label.font             = [UIFont systemFontOfSize:14];
    self.tipsLabel         = label;
    [self.contentView addSubview:label];
    //分割线
    UIView *lineView         = [[UIView alloc]init];
    lineView.backgroundColor = [UIColor colorWithHexString:@"#f2f2f2"];
    self.lineView            = lineView;
    [self.contentView addSubview:lineView];


    [self fitUI];

    return self;
}

- (void)fitUI
{
//    //图标
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(@(20));
        make.centerY.mas_equalTo(self.contentView);
        make.width.mas_equalTo(@(18));
        make.height.mas_equalTo(self.iconImageView.mas_width);
    }];
    //label
    [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.contentView);
        make.left.mas_equalTo(self.iconImageView.mas_right).offset = 6;
        make.right.mas_equalTo(-2);
    }];
    //lineView
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.iconImageView.mas_right).offset  = 8;
        make.right.mas_equalTo(@-8);
        make.height.mas_equalTo(@1);
        make.bottom.mas_equalTo(@0);
    }];
}


- (void)setData:(id<HXSettingCellAdaperProtocol>)data
{
    _data = data;
    self.iconImageView.image        = [UIImage imageNamed:[data iconNameStr]];
    self.tipsLabel.text             = [data titleString];
    self.accessoryView              = [data accessibilityView]?[data accessibilityView]:nil;

    if ([data iconNameStr].length <= 0) {
        //label
        [self.tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.contentView);
            make.left.mas_equalTo(@(20));
//            make.right.mas_equalTo(-2);
        }];
    }
}

@end
