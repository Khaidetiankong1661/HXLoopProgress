//
//  HXSettingModelAdaper.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXSettingModelAdaper.h"
#import "HXSettingModel.h"


@implementation HXSettingModelAdaper

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
    HXSettingModel *model = self.data;
    return model.icon;
}

- (NSString *)titleString
{
    HXSettingModel *model = self.data;
    return model.title;
}

- (UIView *)accessibilityView
{
    HXSettingModel *model = self.data;
    return model.accessibilityView;
}

- (OptionBlock)optionBlock
{
    HXSettingModel *model = self.data;
    return model.block;
}

- (Class)destVC
{
    HXSettingModel *model = self.data;
    return model.destVC;
}

@end
