//
//  HXSettingCellAdaper.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXSettingCellAdaper.h"

@implementation HXSettingCellAdaper

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
    return nil;
}

- (NSString *)titleString
{
    return nil;
}

- (UIView *)accessibilityView
{
    return nil;
}

- (OptionBlock)optionBlock
{
    return nil;
}

- (Class)destVC
{
    return nil;
}

@end
