//
//  PopView.h
//  persionClient-413
//
//  Created by nhz on 16/5/6.
//  Copyright © 2016年 longch. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PopView;

@protocol PopViewDelegate <NSObject>

@optional
- (void)popViewDidDismissed:(PopView *)popView;
@end

@interface PopView : UIView
@property (nonatomic, weak) id<PopViewDelegate> delegate;
@property (nonatomic, assign, getter = isDimBackground) BOOL dimBackground;

@property (nonatomic, strong) UIView *contentView;
@property (nonatomic, weak) UIButton *cover;
@property (nonatomic, weak) UIImageView *container;

/**
 *  初始化方法
 */
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype)PopViewWithContentView:(UIView *)contentView;

/**
 *  设置菜单的背景图片
 */
- (void)setBackground:(UIImage *)background;

/**
 *  显示菜单
 */
- (void)showInRect:(CGRect)rect;

/**
 *  关闭菜单
 */
- (void)dismiss;

@end
