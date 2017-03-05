//
//  LCAlertCollectionViewCell.m
//  UICollectionView
//
//  Created by nhz on 16/6/3.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "LCAlertCollectionViewCell.h"

@interface LCAlertCollectionViewCell()


@end

@implementation LCAlertCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createContentViews];
    }
    return self;
}

-(void)createContentViews{
    AnimatorView * view = [[AnimatorView alloc] initWithFrame:self.bounds];
    self.animaView = view;
    [self.contentView addSubview:view];
    
    self.contentView.layer.cornerRadius = 5.0f;
    self.animaView.forheadView.layer.cornerRadius = 5.0f;
    self.animaView.backView.layer.cornerRadius = 5.0f;
}

-(void)setAnimaSelected:(BOOL)animaSelected{
    _animaSelected = animaSelected;
    self.animaView.selected = animaSelected;
}

-(void)setNoAnimaSelected:(BOOL)noAnimaSelected{
    _noAnimaSelected = noAnimaSelected;
    self.animaView.noAnimaSelected = noAnimaSelected;
}


@end
