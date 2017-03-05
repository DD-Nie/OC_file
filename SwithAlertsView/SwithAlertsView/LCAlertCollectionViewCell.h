//
//  LCAlertCollectionViewCell.h
//  UICollectionView
//
//  Created by nhz on 16/6/3.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AnimatorView.h"

@interface LCAlertCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) AnimatorView * animaView;

@property (nonatomic, assign) BOOL animaSelected;

@property (nonatomic, assign) BOOL noAnimaSelected;

@end
