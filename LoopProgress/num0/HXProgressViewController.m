//
//  HXProgressViewController.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//  主要注意点：mask蒙层

#import "HXProgressViewController.h"
#import "HXLoopProgressView.h"

@interface HXProgressViewController ()
@property (weak, nonatomic) IBOutlet HXLoopProgressView *views;
@property (weak, nonatomic) IBOutlet UISlider *slider;

@end

@implementation HXProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    self.view.backgroundColor = [UIColor whiteColor];

    [self performSelector:@selector(anima) withObject:self afterDelay:3];
}

- (void)anima {
    [_views setPer:0.8];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)slider:(UISlider *)sender {
    _views.persentage = sender.value;

}
@end
