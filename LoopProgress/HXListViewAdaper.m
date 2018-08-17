//
//  HXListViewAdaper.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXListViewAdaper.h"
#import "HXListModel.h"

@interface HXListViewAdaper()

@property (nonatomic, strong) UIImageView *imagev;
@end

@implementation HXListViewAdaper

- (instancetype)initWithData:(id)data
{
    if (self == [super init]) {
        self.data = data;
    }
    return self;
}

#pragma mark  --HXSettingCellAdaperProtocol
- (NSString *)iconNameStr
{
    HXListModel *model = self.data;
    return model.iconName;
}

- (NSString *)titleString
{
    HXListModel *model = self.data;
    return model.titleStr;
}

- (UIView *)accessibilityView
{
    return self.imagev;
}

- (OptionBlock)optionBlock
{
    HXListModel *model = self.data;
    return model.blockk;
}

- (Class)destVC
{
    HXListModel *model = self.data;
    return model.destVC;
}

- (UIImageView *)imagev
{
    if (!_imagev) {

        UIImageView *imageiew  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"rightArrow"]];
        imageiew.frame = CGRectMake(0, 0, 10, 20);
        imageiew.contentMode = UIViewContentModeScaleAspectFit;
        _imagev = imageiew;
    }
    return _imagev;
}

@end
