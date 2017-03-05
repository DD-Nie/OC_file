//
//  HzButton.m
//  play
//
//  Created by nhz on 16/1/21.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "HzButton.h"

@implementation HzButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

-(void)setType:(ButtonType)type{
    _type = type;
    if (type == ButtonTypeAdd) {
        [self setImage:[UIImage imageNamed:@"record_barcell_add"] forState:UIControlStateNormal];
        self.titleLabel.hidden = NO;
    } else if (type == ButtonTypeMinus){
        [self setImage:[UIImage imageNamed:@"record_barcell_minus"] forState:UIControlStateNormal];
        self.titleLabel.hidden = YES;
    }
}


@end
