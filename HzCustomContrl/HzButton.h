//
//  HzButton.h
//  play
//
//  Created by nhz on 16/1/21.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ButtonTypeAdd,
    ButtonTypeMinus
} ButtonType;

@interface HzButton : UIButton

@property (nonatomic, assign) ButtonType type;

@end
