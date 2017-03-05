//
//  HzTagsView.h
//  HzTagViews
//
//  Created by nhz on 16/3/27.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HzTagsViewConfig.h"

@interface HzTagsView : UIView

- (instancetype)initWithFrame:(CGRect)frame config:(HzTagsViewConfig *)config;
- (CGFloat)updateFrame;
@property (nonatomic, assign) CGFloat contentHeight;

@property (nonatomic, strong) HzTagsViewConfig * config;

@end
