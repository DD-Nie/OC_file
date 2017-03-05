//
//  LCHeaderToolBar.h
//  SwithAlertsView
//
//  Created by nhz on 16/6/8.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    indexDate,
    indexToday,
    indexLeft,
    indexRight
} ClickIndex;
@interface LCHeaderToolBar : UIView
-(void)addTargetClick:(void(^)(LCHeaderToolBar * toolBar, ClickIndex index))callBack;

-(void)enableSubButtons:(BOOL)enable;

@end
