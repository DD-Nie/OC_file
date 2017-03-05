//
//  PopView.m
//  persionClient-413
//
//  Created by nhz on 16/5/6.
//  Copyright © 2016年 longch. All rights reserved.
//
#import "PopView.h"

@interface PopView()

@end

@implementation PopView
#pragma mark - 初始化方法
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIButton *cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor clearColor];
        [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        UIImageView *container = [[UIImageView alloc] init];
        container.userInteractionEnabled = YES;
        [self addSubview:container];
        self.container = container;
        
    }
    return self;
}

- (instancetype)initWithContentView:(UIView *)contentView
{
    if (self = [super init]) {
        self.contentView = contentView;
    }
    return self;
}

+ (instancetype)PopViewWithContentView:(UIView *)contentView
{
    return [[self alloc] initWithContentView:contentView];
}


- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.cover.frame = self.bounds;
}

#pragma mark - 内部方法
- (void)coverClick
{
    [self dismiss];
}

#pragma mark - 公共方法
- (void)setDimBackground:(BOOL)dimBackground
{
    _dimBackground = dimBackground;
    
    if (dimBackground) {
        self.cover.backgroundColor = [UIColor blackColor];
        self.cover.alpha = 0.3;
    } else {
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 1.0;
    }
}
- (void)setBackground:(UIImage *)background
{
    self.container.image = background;
}

- (void)showInRect:(CGRect)rect
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    self.container.frame = rect;
    [self.container addSubview:self.contentView];
    __weak __block typeof(self)weakSelf = self;
    self.container.alpha = 0.0f;
    [UIView animateWithDuration:0.25 animations:^{
        weakSelf.container.alpha = 1.0f;
    }];
    
    CGFloat topMargin = 17;
    CGFloat leftMargin = 15;
    CGFloat rightMargin = 5;
    CGFloat bottomMargin = 13;
    self.contentView.y = topMargin;
    self.contentView.x = leftMargin;
    self.contentView.width = self.container.width - leftMargin - rightMargin;
    self.contentView.height = self.container.height - topMargin - bottomMargin;
}

- (void)dismiss
{
    __weak __block typeof(self)weakSelf = self;
    if ([self.delegate respondsToSelector:@selector(popViewDidDismissed:)]) {
        [self.delegate popViewDidDismissed:self];
    }
    [UIView animateWithDuration:0.9 animations:^{
        weakSelf.container.alpha = 0.0f;
    } completion:^(BOOL finished) {
        finished = YES;
        [weakSelf removeFromSuperview];
    }];
}


@end
