//
//  FactoryTwoModel.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FactoryTwoModel.h"
#import "HXOperationTwoTVCell.h"

@implementation FactoryTwoModel

- (HXOperationTwoTVCell *)createProductWithTableView:(UITableView *)tableView;
{
    static NSString *operrationOneTVCellIdentifier = @"HXOperationTwoTVCellIdentifier";

    HXOperationTwoTVCell *cell = [tableView dequeueReusableCellWithIdentifier:operrationOneTVCellIdentifier];

    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HXOperationTwoTVCell" owner:nil options:nil].lastObject;
    }
    return cell;
}

@end
