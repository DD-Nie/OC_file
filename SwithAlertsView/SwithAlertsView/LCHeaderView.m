//
//  LCHeaderView.m
//  SwithAlertsView
//
//  Created by nhz on 16/6/8.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "LCHeaderView.h"

#define kEdgePadding (10)

@implementation LCHeaderView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGRect backFrame = self.bounds;
        backFrame.size.width = backFrame.size.width - 2*kEdgePadding;
        backFrame.origin.x = kEdgePadding;
        UIView * backView = [[UIView alloc] initWithFrame:backFrame];
        backView.backgroundColor = [UIColor lightGrayColor];
        [self addSubview:backView];
        backView.layer.cornerRadius = 5.0f;
        
        
        UILabel * leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(kEdgePadding, 0, 200, frame.size.height)];
        leftLabel.backgroundColor = [UIColor clearColor];
        self.leftLabel = leftLabel;
        [backView addSubview:leftLabel];
        
        
        CGRect rightLabelFrame = backView.bounds;
        rightLabelFrame.origin.x = rightLabelFrame.size.width * 0.5;
        rightLabelFrame.size.width = rightLabelFrame.size.width * 0.5 - kEdgePadding;
        UILabel * rightLabel = [[UILabel alloc] initWithFrame:rightLabelFrame];
        rightLabel.textAlignment = NSTextAlignmentRight;
        rightLabel.backgroundColor = [UIColor clearColor];
        self.rightLabel = rightLabel;
        [backView addSubview:rightLabel];
        
    }
    return self;
}
+(NSString *)headerIdentifier{
    return @"LCHeaderView";
}

@end
