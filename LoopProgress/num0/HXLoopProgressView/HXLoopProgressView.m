
//  HXLoopProgressView.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/8.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXLoopProgressView.h"
#import "HXLoopProgressView+BaseConfiguration.h"

#define SELF_WIDTH CGRectGetWidth(self.bounds)
#define SELF_HEIGHT CGRectGetHeight(self.bounds)


@interface HXLoopProgressView()

@property (nonatomic, strong)CAGradientLayer *muchColorLayer;
@property (nonatomic, strong)CAShapeLayer *muchColorMashLayer;

@end

@implementation HXLoopProgressView

- (void)awakeFromNib
{
    [super awakeFromNib];

    self.backgroundColor = [HXLoopProgressView backgroundColor];

    [self setMuchColor];
    [self setMuchColoMask];
    [self settUI];
    self.muchColorMashLayer.strokeEnd = 0.5;
}

/**
 创建彩色layer 并把layer添加到view的layer上
 */
- (void)setMuchColor
{
    CAGradientLayer *layer = [CAGradientLayer layer];

    layer.frame = CGRectMake(0, 0, SELF_WIDTH, SELF_HEIGHT);

    layer.colors = @[(id)[HXLoopProgressView startColor].CGColor,
                     (id)[HXLoopProgressView endColor].CGColor];

    layer.startPoint = CGPointMake(0, 0);
    layer.endPoint = CGPointMake(1, 0);
    layer.locations = @[@0.1, @0.6];

    self.muchColorLayer = layer;
    [self.layer addSublayer:layer];
}

/**
 为彩色layer添加蒙层mask。这个mask有点讲究，有不清楚的可以看一下我页面的详细解说
 */
- (void)setMuchColoMask
{
    CAShapeLayer *mashLayer = [self generateMaskLayer];
    self.muchColorMashLayer = mashLayer;
    self.muchColorLayer.mask = mashLayer;
}

/**
 为view的layer添加蒙层mask。
 */
- (void)settUI
{
    CAShapeLayer *layer = [self generateMaskLayer];
//    layer.lineWidth = 30;
    [self.layer addSublayer:layer];
    self.layer.mask = layer;
}

/**
 创建圆环，适合做蒙层，也适合画纯色图形

 @return CAShapeLayer
 */
- (CAShapeLayer *)generateMaskLayer
{
    CAShapeLayer *layer = [CAShapeLayer layer];
    
    layer.frame = self.bounds;

    UIBezierPath *paths = nil;
    paths = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SELF_WIDTH / 2, SELF_HEIGHT / 2) radius:SELF_WIDTH / 2.5 startAngle:[HXLoopProgressView startAngle] endAngle:[HXLoopProgressView endAngle] clockwise:YES];
    layer.lineWidth = [HXLoopProgressView lineWidth];

    layer.fillColor = [UIColor clearColor].CGColor;

    layer.strokeColor = [UIColor blackColor].CGColor;

    layer.lineCap = kCALineCapRound;

    layer.path = paths.CGPath;

    return layer;
}

/**
 加了一个动画，如果不要动画的直接去掉，把注掉部分打开即可

 @param persentage 进度
 */
- (void)setPersentage:(CGFloat)persentage
{
    // 如果不要动画 把这两行打开 下面那行注掉即可
    _persentage = persentage;
    self.muchColorMashLayer.strokeEnd = persentage;

//    [self setPer:persentage];
}

// 动画
- (void)setPer:(CGFloat)persent
{

    [CATransaction begin];
    [CATransaction setDisableActions:NO];
    [CATransaction setAnimationTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn]];
    [CATransaction setAnimationDuration:1.5];
    _muchColorMashLayer.strokeEnd = persent;
    [CATransaction commit];

    _persentage = persent;

}

@end
