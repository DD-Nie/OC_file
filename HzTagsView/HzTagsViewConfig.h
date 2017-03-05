//
//  HzTagsViewConfig.h
//  HzTagViews
//
//  Created by nhz on 16/3/27.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HzTagsViewConfig : NSObject

@property (nonatomic, assign) CGFloat PaddingOfTop;
@property (nonatomic, assign) CGFloat PaddingOfBottom;
@property (nonatomic, assign) CGFloat PaddingOfLetf;
@property (nonatomic, assign) CGFloat PaddingOfRight;
@property (nonatomic, assign) CGFloat minimumInteritemSpacing;
@property (nonatomic, assign) CGFloat minimumLineSpacing;
@property (nonatomic, strong) UIColor * tagBackColor;
@property (nonatomic, strong) UIColor * tagTextColor;
@property (nonatomic, assign) CGFloat tagCornerRadius;

- (void)addSectionArrs:(NSMutableArray *)firstObj, ...NS_REQUIRES_NIL_TERMINATION;
- (void)addSectionTitles:(NSString *)firstTitle, ...NS_REQUIRES_NIL_TERMINATION;


@property (nonatomic, strong) NSMutableArray * sectionsArr;
@property (nonatomic, strong) NSMutableArray * sectionsTitle;

@end
