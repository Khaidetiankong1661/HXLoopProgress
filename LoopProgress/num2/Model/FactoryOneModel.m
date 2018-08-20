//
//  FactoryOneModel.m
//  LoopProgress
//
//  Created by hongbaodai on 2018/8/20.
//  Copyright © 2018年 wang. All rights reserved.
//

#import "FactoryOneModel.h"
#import "HXOperrationOneTVCell.h"

@implementation FactoryOneModel

- (HXBaseOperationTVCell *)createProductWithTableView:(UITableView *)tableView;
{
    static NSString *operrationOneTVCellIdentifier = @"operrationOneTVCellIdentifier";

    HXOperrationOneTVCell *cell = [tableView dequeueReusableCellWithIdentifier:operrationOneTVCellIdentifier];

    if (!cell) {
        cell = [[NSBundle mainBundle] loadNibNamed:@"HXOperrationOneTVCell" owner:nil options:nil].lastObject;
    }
    return cell;
}


@end
