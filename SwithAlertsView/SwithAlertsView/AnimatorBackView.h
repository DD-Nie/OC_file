//
//  AnimatorBackView.h
//  UICollectionView
//
//  Created by nhz on 16/6/3.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AnimatorBackView;
@protocol AnimatorBackViewDelegate <NSObject>

-(void)animatorBackView:(AnimatorBackView *)backView didClickCancelBtn:(UIButton *)btn;

-(void)animatorBackView:(AnimatorBackView *)backView didClickEditorBtn:(UIButton *)btn;

-(void)animatorBackView:(AnimatorBackView *)backView didClickStateBtn:(UIButton *)btn;


@end


@interface AnimatorBackView : UIView


@property (nonatomic, assign) id<AnimatorBackViewDelegate> delegate;


-(void)closeAlert;
-(void)openAlert;

@end
