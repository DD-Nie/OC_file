//
//  HzTitleButton.m
//  First
//
//  Created by nhz on 15/11/24.
//  Copyright © 2015年 nhz. All rights reserved.
//

#import "HzTitleButton.h"
#import "UIView+frameAdjust.h"
//#import "HzHeader.h"
#import "NHZ.h"

#define NavigationTitleButtonFont [UIFont boldSystemFontOfSize:17]
#define NavigatinTitleButtonHeight 30

@interface HzTitleButton()


@end


@implementation HzTitleButton

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.imageView.contentMode = UIViewContentModeCenter;
        self.titleLabel.textAlignment = NSTextAlignmentRight;
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        self.titleLabel.font = NavigationTitleButtonFont;
        self.adjustsImageWhenHighlighted = NO;
    }
    return self;
}

-(CGRect)imageRectForContentRect:(CGRect)contentRect{
    CGFloat imageY = 0;
    CGFloat imageW = self.height;
    CGFloat imageH = imageW;
    CGFloat imageX = self.width - imageW;
    return CGRectMake(imageX, imageY, imageW, imageH);
}

-(CGRect)titleRectForContentRect:(CGRect)contentRect{
    CGFloat titleY = 0;
    CGFloat titleH = self.height;
    CGFloat titleX = 0;
    CGFloat titleW = self.width - self.height;
    
    return CGRectMake(titleX, titleY, titleW, titleH);
}

-(void)setTitle:(NSString *)title forState:(UIControlState)state{
    [super  setTitle:title forState:state];
    CGSize titleSize = [title sizeWithAttributes:@{NSFontAttributeName: self.titleLabel.font}];
    self.width = titleSize.width + self.height + 10;
}


@end
