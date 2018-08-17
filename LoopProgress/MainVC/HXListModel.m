//
//  HXListModel.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXListModel.h"

@implementation HXListModel

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc
{
    if (self = [super init]) {
        self.iconName              = icon;
        self.titleStr              = title;
        self.destVC                = destVc ;
    }
    return self;
}


@end
