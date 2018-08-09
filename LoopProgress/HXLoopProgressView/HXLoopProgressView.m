
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

    [self setAnimation];
//    self.muchColorMashLayer.strokeEnd = 0.4;
}

- (void)setAnimation
{
    CABasicAnimation *animat = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animat.duration = 1.5;
    animat.fromValue = @(0);
    animat.toValue = @(0.4);
    [self.muchColorMashLayer addAnimation:animat forKey:nil];

}

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

- (void)setMuchColoMask
{
    CAShapeLayer *mashLayer = [self generateMaskLayer];
    self.muchColorMashLayer = mashLayer;
    self.muchColorLayer.mask = mashLayer;
}


- (void)settUI
{
    CAShapeLayer *layer = [self generateMaskLayer];
    [self.layer addSublayer:layer];
    self.layer.mask = layer;
}

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

- (void)setPersentage:(CGFloat)persentage
{
    _persentage = persentage;
    self.muchColorMashLayer.strokeEnd = persentage;

}

@end
