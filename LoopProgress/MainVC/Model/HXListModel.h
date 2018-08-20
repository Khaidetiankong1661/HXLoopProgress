//
//  HXListModel.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HXSettingCellAdaperProtocol.h"

@interface HXListModel : NSObject

/**
 标签
 */
@property (nonatomic,copy) NSString *titleStr;

/**
 图片名字
 */
@property (nonatomic,copy) NSString *iconName;

/**
 *  目标控制器
 */
@property (nonatomic, assign) Class destVC;

/**
 block
 */
@property (nonatomic,copy) OptionBlock blockk;

/**
 快速创建HXSettingModel

 @param icon 图片名字
 @param title title
 @param destVc 目标控制器
 @return HXSettingModel实例
 */
- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc;

@end
