//
//  HXSettingModel.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "HXSettingCellAdaperProtocol.h"

@interface HXSettingModel : NSObject

/**
 标签
 */
@property (nonatomic,copy) NSString *title;

/**
 图片名字
 */
@property (nonatomic,copy) NSString *icon;

/**
 辅助视图
 */
@property(nonatomic,strong) UIView *accessibilityView;

/**
 *  目标控制器
 */
@property (nonatomic, assign) Class destVC;

/**
 block
 */
@property (nonatomic,copy) OptionBlock block;

/**
 快速创建HXSettingModel

 @param icon 图片名字
 @param title title
 @param destVc 目标控制器
 @param accessibilityView 辅助视图
 @return HXSettingModel实例
 */
- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc andAccessibilityView:(UIView *)accessibilityView;

@end
