//
//  HXListViewAdaper.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXListViewAdaper.h"
#import "HXListModel.h"
#import "HXIamgeView.h"


@interface HXListViewAdaper()

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
    return [HXIamgeView imageVie];
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

@end
