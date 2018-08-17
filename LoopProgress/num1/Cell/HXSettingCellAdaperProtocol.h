//
//  HXSettingCellAdaperProtocol.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^OptionBlock)(void);

@protocol HXSettingCellAdaperProtocol <NSObject>

// 返回的图片名字
- (NSString *)iconNameStr;

// 返回的title
- (NSString *)titleString;

// 返回的accessiView
- (UIView *)accessibilityView;

// 需要操作的函数代码
- (OptionBlock)optionBlock;

// 点击进入下一个页面的控制器
- (Class)destVC;

@end
