//
//  AnimatorView.h
//  UICollectionView
//
//  Created by nhz on 16/6/2.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AnimatorBackView.h"

@interface AnimatorView : UIView


@property (nonatomic, assign) BOOL selected;

/**
 *  选中不出现动画
 */
@property (nonatomic, assign) BOOL noAnimaSelected;

//@property (nonatomic, strong) UIView * backView;

@property (nonatomic, strong) UIView * forheadView;
@property (nonatomic, strong) AnimatorBackView * backView;

@end
