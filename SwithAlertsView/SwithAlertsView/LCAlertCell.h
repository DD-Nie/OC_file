//
//  LCAlertCell.h
//  UICollectionView
//
//  Created by nhz on 16/6/3.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "LCAlertCollectionViewCell.h"
#import "MBSwitch.h"

@class LCAlertCell;

@protocol LCAlertCellDelegate <NSObject>

-(void)LCAlertCellDidClickEditBtn:(LCAlertCell *)cell;

@end

@interface LCAlertCell : LCAlertCollectionViewCell


@property (nonatomic, strong) MBSwitch * switchBtn;

@property (nonatomic, assign) id <LCAlertCellDelegate> delegate;


@end
