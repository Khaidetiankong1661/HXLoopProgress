//
//  HXSettingCellAdaper.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HXSettingCellAdaperProtocol.h"

@interface HXSettingCellAdaper : NSObject<HXSettingCellAdaperProtocol>

/**
 模型data
 */
@property (nonatomic, strong) id data;

/**
 适配器与模型对象建立联系

 @param data 模型data
 @return HXSettingCellAdaper实例
 */
- (instancetype)initWithData:(id)data;

@end
