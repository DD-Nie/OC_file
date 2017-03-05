//
//  HzHeaderViewOfRecord.h
//  play
//
//  Created by nhz on 16/1/21.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HzTagsHeaderView : UICollectionReusableView

@property (nonatomic, strong) UILabel * nameLabel;
//记录自己的索引
@property (nonatomic, strong) NSIndexPath * headerIndexPath;

@end
