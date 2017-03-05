//
//  HzPopView.h
//  First
//
//  Created by nhz on 15/11/24.
//  Copyright © 2015年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum {
    PopArrowPositionCenter = 0,
    PopArrowPositionLeft,
    PopArrowPositionRight
}PopArrowPosition;

@class HzPopView;

@protocol HzPopViewDelegate <NSObject>

@optional
-(void)hzPopViewDidDismissed:(HzPopView *)popView;

@end

@interface HzPopView : UIView

@property (nonatomic, weak) id<HzPopViewDelegate> delegate;

@property (nonatomic, assign, getter = isDimBackgroud) BOOL dimBackground;

@property (nonatomic, assign) PopArrowPosition arrowPosition;
/**
 *  初始化方法
 */
- (instancetype)initWithContentView:(UIView *)contentView;
+ (instancetype) popViewWithContentView:(UIView *)contentView;
/**
 *  设置菜单背景图片
 */
- (void)setBackgroud:(UIImage *)background;
/**
 *  显示菜单
 */
- (void)showInRect:(CGRect)rect;
/**
 *  取消菜单
 */
- (void)dismiss;
@end
