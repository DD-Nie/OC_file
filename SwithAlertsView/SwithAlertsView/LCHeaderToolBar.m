//
//  LCHeaderToolBar.m
//  SwithAlertsView
//
//  Created by nhz on 16/6/8.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "LCHeaderToolBar.h"

//define this constant if you want to use Masonry without the 'mas_' prefix
#define MAS_SHORTHAND

//define this constant if you want to enable auto-boxing for default syntax
#define MAS_SHORTHAND_GLOBALS

#import "Masonry.h"


@interface LCHeaderToolBar()

@property (nonatomic, copy) void(^callBack)(LCHeaderToolBar * toolBar,ClickIndex index);

@end

@implementation LCHeaderToolBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createViews];
    }
    return self;
}
-(void)createViews{
    
    UIView * superView = self;
    
    UILabel * centerLabel = [[UILabel alloc] init];
    centerLabel.text = @"2016-06-09";
    centerLabel.textAlignment = NSTextAlignmentCenter;
    centerLabel.backgroundColor = [UIColor redColor];
    [superView addSubview:centerLabel];
    
    [centerLabel makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(100);
        make.height.equalTo(superView.mas_height);
        make.centerY.equalTo(superView.mas_centerY);
        make.centerX.equalTo(superView.mas_centerX);
    }];
    
    UIButton * leftButton = [UIButton buttonWithType:UIButtonTypeCustom];
    leftButton.backgroundColor = [UIColor greenColor];
    [superView addSubview:leftButton];
    leftButton.tag = 1000 + indexLeft;
    [leftButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [leftButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(40);
        make.height.equalTo(40);
        make.centerY.equalTo(superView.mas_centerY);
        make.right.equalTo(centerLabel.mas_left);
    }];

    UIButton * rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    rightButton.backgroundColor = [UIColor greenColor];
    [superView addSubview:rightButton];
    rightButton.tag = 1000 + indexRight;
    [rightButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    [rightButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(40);
        make.height.equalTo(40);
        make.centerY.equalTo(superView.mas_centerY);
        make.left.equalTo(centerLabel.mas_right);
    }];

    
    UIButton * dateButton = [UIButton buttonWithType:UIButtonTypeCustom];
    dateButton.backgroundColor = [UIColor greenColor];
    [superView addSubview:dateButton];
    dateButton.tag = 1000 + indexDate;
    [dateButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    [dateButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(40);
        make.height.equalTo(40);
        make.centerY.equalTo(superView.mas_centerY);
        make.left.equalTo(superView.mas_left).offset(10);
    }];

    UIButton * todayButton = [UIButton buttonWithType:UIButtonTypeCustom];
    todayButton.backgroundColor = [UIColor greenColor];
    [superView addSubview:todayButton];
    todayButton.tag = 1000 + indexToday;
    [todayButton addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];

    [todayButton makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(40);
        make.height.equalTo(40);
        make.centerY.equalTo(superView.mas_centerY);
        make.right.equalTo(superView.mas_right).offset(-10);
    }];
}

-(void)addTargetClick:(void(^)(LCHeaderToolBar * toolBar, ClickIndex index))callBack{
    self.callBack = [callBack copy];
}
-(void)btnClick:(UIButton *)btn{
    NSInteger index = btn.tag - 1000;
    if (self.callBack) {
        self.callBack(self, index);
    }
}

-(void)enableSubButtons:(BOOL)enable{
    for (UIView * subView in self.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            ((UIButton *)subView).enabled = enable;
        }
    }
}







@end
