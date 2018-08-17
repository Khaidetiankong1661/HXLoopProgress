//
//  HXIamgeView.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "HXIamgeView.h"

@implementation HXIamgeView

- (instancetype)init
{
    if (self == [super init]) {
        [self setImageView];
    }
    return self;
}

- (instancetype)initWithImage:(UIImage *)image
{
    if (self == [super initWithImage:image]) {
        [self setImageView];
    }
    return self;
}

+ (instancetype)imageVie
{
    HXIamgeView *view = [[HXIamgeView alloc] init];
    [view setImageView];
    return view;
}

- (void)setImageView
{
    self.image = [UIImage imageNamed:@"rightArrow"];
    self.frame = CGRectMake(0, 0, 10, 20);
    self.contentMode = UIViewContentModeScaleAspectFit;
}

@end
