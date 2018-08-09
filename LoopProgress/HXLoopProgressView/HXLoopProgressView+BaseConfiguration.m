//
//  HXLoopProgressView+BaseConfiguration.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/8.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXLoopProgressView+BaseConfiguration.h"
#define DEGREES_TO_RADOANS(x) (M_PI * (x) / 180.0) // 将角度转为弧度

@implementation HXLoopProgressView (BaseConfiguration)


+ (UIColor *)startColor {

//        return [UIColor greenColor];
    return [UIColor colorWithRed:231.0/255.0f green:56.0/255.0f blue:61.0/255.0f alpha:1];
}

+ (UIColor *)centerColor {

//        return [UIColor yellowColor];
    return [UIColor colorWithRed:242.0/255.0f green:88.0/255.0f blue:93.0/255.0f alpha:1];
}

+ (UIColor *)endColor {

//        return [UIColor redColor];
    return [UIColor colorWithRed:245.0/255.0f green:105.0/255.0f blue:112.0/255.0f alpha:1];
}

+ (UIColor *)backgroundColor {

    return [UIColor colorWithRed:227.0 / 255.0 green:227.0 / 255.0 blue:227.0 / 255.0 alpha:1];
}

+ (CGFloat)lineWidth {

    return 10;
}

+ (CGFloat)startAngle {

    return DEGREES_TO_RADOANS(-220);
}

+ (CGFloat)endAngle {

    return DEGREES_TO_RADOANS(40);
}


@end
