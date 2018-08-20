//
//  FactoryModel.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FactoryModel.h"
#import "FactoryOneModel.h"
#import "FactoryTwoModel.h"
#import "FactoryThreeModel.h"
#import "HXBaseOperationTVCell.h"

@implementation FactoryModel

+ (instancetype)initWithDictionary:(NSDictionary *)dic
{
    FactoryModel *factory;

    //根据字典中的key对应的数据初始化不同的子类对象并将其返回给父类
    if ([dic[@"tag"] isEqualToString:@"1"]) {
        factory = [[FactoryOneModel alloc] init];

    } else if ([dic[@"tag"] isEqualToString:@"2"]) {
        factory = [[FactoryTwoModel alloc] init];

    } else if ([dic[@"tag"] isEqualToString:@"3"]) {
        factory = [[FactoryThreeModel alloc] init];
    }

    [factory setValuesForKeysWithDictionary:dic];

    return factory;
}

- (HXBaseOperationTVCell *)createProductWithTableView:(UITableView *)tableView;
{
    return nil;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{

}
@end
