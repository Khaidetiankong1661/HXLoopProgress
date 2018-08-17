//
//  HXLoopProgressView+BaseConfiguration.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/8.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXLoopProgressView.h"

@interface HXLoopProgressView (BaseConfiguration)
// 起始颜色
+ (UIColor *)startColor;

// 中间颜色
+ (UIColor *)centerColor;

// 结束颜色
+ (UIColor *)endColor;

// 背景色
+ (UIColor *)backgroundColor;

// 线宽
+ (CGFloat)lineWidth;

// 起始角度（根据顺时针计算，逆时针则是结束角度）
+ (CGFloat)startAngle;

// 结束角度（根据顺时针计算，逆时针则是起始角度）
+ (CGFloat)endAngle;

@end
