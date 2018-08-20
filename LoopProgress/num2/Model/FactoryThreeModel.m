//
//  FactoryThreeModel.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FactoryThreeModel.h"
#import "HXOperationThreeeTVCell.h"

@implementation FactoryThreeModel

- (HXOperationThreeeTVCell *)createProductWithTableView:(UITableView *)tableView;
{
    static NSString *operrationOneTVCellIdentifier = @"HXOperationThreeeTVCellIdentifier";

    HXOperationThreeeTVCell *cell = [tableView dequeueReusableCellWithIdentifier:operrationOneTVCellIdentifier];

    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HXOperationThreeeTVCell" owner:nil options:nil].lastObject;
    }
    return cell;
}

@end
