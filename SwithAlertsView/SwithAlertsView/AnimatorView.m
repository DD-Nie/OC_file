
//
//  AnimatorView.m
//  UICollectionView
//
//  Created by nhz on 16/6/2.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "AnimatorView.h"

#import "LCAlertDefine.h"

@interface AnimatorView()

//@property (nonatomic, strong) UIView * backView;
//@property (nonatomic, strong) UIView * forheadView;

@end


#define kBackviewHeight 50

@implementation AnimatorView

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
        _selected = NO;
        [self createContentView:frame];
    }
    return self;
}

-(void)setSelected:(BOOL)selected{
    _selected = selected;
    if (_selected) {
        [UIView animateWithDuration:0.25 animations:^{
            //设置父视图frame
            CGRect selfFrame = self.frame;
            selfFrame.size.height = self.forheadView.bounds.size.height + self.backView.bounds.size.height;
            self.frame = selfFrame;
            
            //设置隐藏视图的frame
            CGRect frame = self.backView.bounds;
            frame.origin.y = self.forheadView.frame.size.height;
            self.backView.frame = frame;
            
        }];
    }else{
        [UIView animateWithDuration:0.25 animations:^{
            //设置父视图frame
            CGRect selfFrame = self.frame;
            selfFrame.size.height = self.forheadView.bounds.size.height;
            self.frame = selfFrame;
            
            //设置隐藏视图的frame
            CGRect frame = self.backView.bounds;
            frame.origin.y = self.forheadView.frame.size.height - self.backView.bounds.size.height;
            self.backView.frame = frame;
        }];
    }
}

-(void)setNoAnimaSelected:(BOOL)noAnimaSelected{
    _noAnimaSelected = noAnimaSelected;
    if (_noAnimaSelected) {
        
        //设置父视图frame
        CGRect selfFrame = self.frame;
        selfFrame.size.height = self.forheadView.bounds.size.height + self.backView.bounds.size.height;
        self.frame = selfFrame;
        
        //设置隐藏视图的frame
        CGRect frame = self.backView.bounds;
        frame.origin.y = self.forheadView.frame.size.height;
        self.backView.frame = frame;
        
    }else{
            //设置父视图frame
            CGRect selfFrame = self.frame;
            selfFrame.size.height = self.forheadView.bounds.size.height;
            self.frame = selfFrame;
            
            //设置隐藏视图的frame
            CGRect frame = self.backView.bounds;
            frame.origin.y = self.forheadView.frame.size.height - self.backView.bounds.size.height;
            self.backView.frame = frame;
    }
}

-(void)btnClick{
    
}

-(void)createContentView:(CGRect)frame{
    
    UIView * forheadView = [[UIView alloc] initWithFrame:self.bounds];
    forheadView.backgroundColor = [UIColor greenColor];
    self.forheadView = forheadView;
    
    CGRect backViewFrame = self.forheadView.bounds;
    backViewFrame.size.height = kAlertCellBackViewHeight;
    backViewFrame.origin.y = self.forheadView.frame.size.height - backViewFrame.size.height;
//    backView.frame = backViewFrame;
    
    AnimatorBackView * backView = [[AnimatorBackView alloc] initWithFrame:backViewFrame];
    self.backView = backView;
    
//    UIButton * btn = [UIButton buttonWithType:UIButtonTypeContactAdd];
//    [backView addSubview:btn];
//    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:backView];
    
    [self addSubview:forheadView];
}


@end
