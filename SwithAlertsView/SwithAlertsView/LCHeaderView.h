//
//  LCHeaderView.h
//  SwithAlertsView
//
//  Created by nhz on 16/6/8.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LCHeaderView : UICollectionReusableView

@property (nonatomic, strong) UILabel * rightLabel;
@property (nonatomic, strong) UILabel * leftLabel;

+(NSString *)headerIdentifier;

@end
