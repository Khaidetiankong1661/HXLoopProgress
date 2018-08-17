//
//  AdapterViewController.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/17.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HXSettingCellAdaper.h"

@interface AdapterViewController : UIViewController

- (NSMutableArray <NSMutableArray<HXSettingCellAdaper*> *>*)getDataSource;

@end
