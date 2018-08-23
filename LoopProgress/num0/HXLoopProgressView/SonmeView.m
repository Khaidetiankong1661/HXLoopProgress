//
//  SonmeView.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/23.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "SonmeView.h"
#import "HXLoopProgressView+BaseConfiguration.h"

#define SELF_WIDTH CGRectGetWidth(self.bounds)
#define SELF_HEIGHT CGRectGetHeight(self.bounds)
#define DEGREES_TO_RADOANS(x) (M_PI * (x) / 180.0) // 将角度转为弧度


@interface SonmeView()

@property (nonatomic, strong) CAShapeLayer *layerr;

@property (nonatomic, strong)CAGradientLayer *muchColorLayer;
@property (nonatomic, strong)CAShapeLayer *muchColorMashLayer;

@property (nonatomic, strong)CALayer *backLaber;

@property (nonatomic, strong)CALayer *backLaber2;

@property (nonatomic, strong) CALayer *linelayer;

@end

@implementation SonmeView


- (void)awakeFromNib
{
    [super awakeFromNib];

    self.backgroundColor = [HXLoopProgressView backgroundColor];
    [self addBacKLayer];

    [self setMuchColor];
    [self setMuchColoMask];
}

- (void)addBacKLayer
{

    CALayer *btmLayer = [CALayer layer];
    btmLayer.frame = self.bounds;
    btmLayer.contents = (id)[UIImage imageNamed:@"bgTransparent3"].CGImage; //
    btmLayer.contentsGravity = kCAGravityResizeAspect;
    btmLayer.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0].CGColor;

    self.backLaber = btmLayer;
    [self.layer addSublayer: btmLayer];

    CALayer *backLaber2 = [CALayer layer];
    backLaber2.frame = self.bounds;
    backLaber2.contents = (id)[UIImage imageNamed:@"bgTransparent3"].CGImage; //
    backLaber2.contentsGravity = kCAGravityResizeAspect;
    backLaber2.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0].CGColor;

    self.backLaber2 = backLaber2;
    [self.backLaber addSublayer: backLaber2];
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
    //    layer.locations = @[@0.1, @0.5, @0.9];

    self.muchColorLayer = layer;
    [self.backLaber2 addSublayer:layer];
}

/**
 为彩色layer添加蒙层mask。这个mask有点讲究，有不清楚的可以看一下我页面的详细解说
 */
- (void)setMuchColoMask
{
    CALayer *btmLayer = [CALayer layer];
    btmLayer.frame = self.bounds;
    btmLayer.contents = (id)[UIImage imageNamed:@"bgTransparent"].CGImage; //
    btmLayer.contentsGravity = kCAGravityResizeAspect;
    btmLayer.backgroundColor = [UIColor colorWithRed:1 green:1 blue:1 alpha:0].CGColor;

    self.muchColorLayer.mask = btmLayer;

    CAShapeLayer *mashLayer = [self generateMaskLayer];
    self.muchColorMashLayer = mashLayer;
    self.backLaber2.mask = mashLayer;

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

    paths = [UIBezierPath bezierPathWithArcCenter:CGPointMake(SELF_WIDTH / 2, SELF_HEIGHT / 2 + 38) radius:SELF_WIDTH / 2.5 + 10 startAngle:DEGREES_TO_RADOANS(-180) endAngle:DEGREES_TO_RADOANS(0) clockwise:YES];

    layer.lineWidth = 25;

    layer.fillColor = [UIColor clearColor].CGColor;

    layer.strokeColor = [UIColor blackColor].CGColor;

    layer.lineCap = kCALineCapRound;

    layer.path = paths.CGPath;

    return layer;
}

/**
 加了一个动画，如果不要动画的直接去掉，把注掉部分打开即可

 @param persent 进度
 */
- (void)setSSSPer:(CGFloat)persent
{

    // 如果不要动画 把这两行打开 下面那行注掉即可
//    _persentage = persent;
    self.muchColorMashLayer.strokeEnd = persent;

    [self addSome];
}

- (void)addSome
{

    [self.self.linelayer removeFromSuperlayer];

    CAShapeLayer *layer = [CAShapeLayer layer];
    layer = [self generateMaskLayer];
    layer.lineWidth = 25;

    layer.strokeStart = _muchColorMashLayer.strokeEnd;
    layer.strokeEnd = _muchColorMashLayer.strokeEnd + 0.006;

    self.linelayer = layer;
    [self.backLaber addSublayer:layer];
}
@end
