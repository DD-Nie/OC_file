//
//  HzHeaderViewOfRecord.m
//  play
//
//  Created by nhz on 16/1/21.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "HzTagsHeaderView.h"


#define kInnerViewWidth (self.width - 30)
#define kInnerViewPointX 110



@implementation HzTagsHeaderView

-(void)setContentLabel{
    if (self.nameLabel) {
        return;
    }
    UILabel * nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 15, 80, 10)];
    [self addSubview:nameLabel];
    nameLabel.textAlignment = NSTextAlignmentLeft;
    nameLabel.textColor = [UIColor blackColor];
    nameLabel.font = [UIFont boldSystemFontOfSize:14];
    nameLabel.backgroundColor = [UIColor clearColor];
    self.nameLabel = nameLabel;
    self.backgroundColor = [UIColor clearColor];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setContentLabel];
    }
    return self;
}





@end
