//
//  UIColor+Tool.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Tool)

/**
 便利创建颜色

 @param string 16进制颜色字符
 @return UIColor
 */
+ (UIColor *)colorWithHexString:(NSString *)string;

@end
