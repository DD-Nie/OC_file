//
//  HzPopView.m
//  First
//
//  Created by nhz on 15/11/24.
//  Copyright © 2015年 nhz. All rights reserved.
//

#import "HzPopView.h"
#import "UIImage+HzExtension.h"
#import "UIView+frameAdjust.h"

#import "NHZ.h"

@interface HzPopView()
@property (nonatomic, strong) UIView * contentView;
/**
 *  添加一个遮盖
 */
@property (nonatomic, weak) UIButton * cover;
@property (nonatomic, weak) UIImageView * container;

@end

@implementation HzPopView

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
        UIButton * cover = [[UIButton alloc] init];
        cover.backgroundColor = [UIColor blueColor];
        [cover addTarget:self action:@selector(coverClick) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cover];
        self.cover = cover;
        
        UIImageView * container = [[UIImageView alloc] init];
        container.userInteractionEnabled = YES;
        container.image = [UIImage imageStretchImage:@"popover_background"];
        [self addSubview:container];
        self.container = container;
    }
    return self;
}

- (instancetype) initWithContentView:(UIView *)contentView{
    self = [super init];
    if (self) {
        self.contentView = contentView;
    }
    return self;
}

+ (instancetype) popViewWithContentView:(UIView *)contentView{
    return [[self alloc] initWithContentView:contentView];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.cover.frame = self.bounds;
}

#pragma mark - 内部方法
- (void)coverClick{
    [self dismiss];
}

#pragma mark 公共方法

-(void)setDimBackground:(BOOL)dimBackground{
    _dimBackground = dimBackground;
    if (dimBackground) {
        self.cover.backgroundColor = [UIColor blackColor];
        self.cover.alpha = 0.3;
    }else{
        self.cover.backgroundColor = [UIColor clearColor];
        self.cover.alpha = 1.0;
    }
}
-(void)setArrowPosition:(PopArrowPosition)arrowPosition{
    _arrowPosition = arrowPosition;
    switch (arrowPosition) {
        case PopArrowPositionCenter:
            self.container.image = [UIImage imageStretchImage:@"popover_background"];
            break;
        case PopArrowPositionLeft:
            self.container.image = [UIImage imageStretchImage:@"popover_background_left"];
            break;
        case PopArrowPositionRight:
            self.container.image = [UIImage imageStretchImage:@"popover_background_right"];
            break;
            
        default:
            break;
    }
}

-(void)setBackgroud:(UIImage *)background{
    self.container.image = background;
}
-(void)showInRect:(CGRect)rect{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    self.frame = window.bounds;
    [window addSubview:self];
    
    //设置容器的frame
    self.container.frame = rect;
    [self.container addSubview:self.contentView];
    
    //设置容器里面的边距
    CGFloat topMargin = 12;
    CGFloat leftMargin = 5;
    CGFloat rightMargin = 5;
    CGFloat bottomMargin = 8;
    
    self.contentView.y = topMargin;
    self.contentView.x = leftMargin;
    self.contentView.width = self.container.width - leftMargin - rightMargin;
    self.contentView.height = self.container.height - topMargin - bottomMargin;
}
- (void)dismiss{
    if ([self.delegate respondsToSelector:@selector(hzPopViewDidDismissed:)]) {
        [self.delegate hzPopViewDidDismissed:self];
    }
    [self removeFromSuperview];
}

@end
