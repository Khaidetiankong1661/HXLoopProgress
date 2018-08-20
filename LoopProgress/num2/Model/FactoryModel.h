//
//  FactoryModel.h
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import <Foundation/Foundation.h>
@class HXBaseOperationTVCell;

@interface FactoryModel : NSObject

@property(nonatomic, copy) NSString *title;


+ (instancetype)initWithDictionary:(NSDictionary *)dic;


- (HXBaseOperationTVCell *)createProductWithTableView:(UITableView *)tableView;

@end
