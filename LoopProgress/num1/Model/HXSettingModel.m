//
//  HXSettingModel.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXSettingModel.h"

@implementation HXSettingModel

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc andAccessibilityView:(UIView *)accessibilityView
{
    if (self = [super init]) {
        self.icon              = icon;
        self.title             = title;
        self.destVC            = destVc ;
        self.accessibilityView = accessibilityView;
    }
    return self;
}

@end
