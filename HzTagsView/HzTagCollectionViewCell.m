//
//  HzTagCollectionViewCell.m
//  HzTagViews
//
//  Created by nhz on 16/3/26.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "HzTagCollectionViewCell.h"

#import "UIColor+Extension.h"

@implementation HzTagCollectionViewCell

- (void)awakeFromNib {
    // Initialization code
    self.textLabel.numberOfLines = 0;
    self.textLabel.font = [UIFont systemFontOfSize:14];
    self.textLabel.textColor = [UIColor colorWithHexString:@"#7d7d7d"];
}

@end
