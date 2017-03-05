//
//  AnimatorBackView.m
//  UICollectionView
//
//  Created by nhz on 16/6/3.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "AnimatorBackView.h"
#import "LCAlertDefine.h"

@interface AnimatorBackView()

@property (nonatomic, strong) UIButton * editBtn;
@property (nonatomic, strong) UIButton * stateBtn;
@property (nonatomic, strong) UIButton * cancelBtn;

@end


@implementation AnimatorBackView

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
        [self layoutButtons:frame];
    }
    return self;
}
-(void)layoutButtons:(CGRect)frame{
    
    self.backgroundColor = [UIColor colorWithRed:0.35 green:0.56 blue:0.7 alpha:1.0f];
    
//    CGFloat buttonHeight = 25;
    CGFloat buttonFontSize = 12.5f;
    CGFloat buttonMargin = 10.0f;
    
    CGFloat width = frame.size.width;
    CGFloat height = frame.size.height;
    
    UIButton * editBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    editBtn.frame = CGRectMake(width - 40 - buttonMargin, (height-kAlertCellBackViewButtonHeight)/2, 40, kAlertCellBackViewButtonHeight);
    editBtn.layer.cornerRadius = 5.0f;
    editBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    editBtn.layer.borderWidth = 1.0f;
    editBtn.titleLabel.font = [UIFont systemFontOfSize:buttonFontSize];
    [editBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    [editBtn setTitle:@"编辑" forState:UIControlStateNormal];
    self.editBtn = editBtn;
    [self addSubview:editBtn];
    
    UIButton * cancelBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    cancelBtn.frame = CGRectMake(width - 40 - 70 - 2*buttonMargin, (height-kAlertCellBackViewButtonHeight)/2, 70, kAlertCellBackViewButtonHeight);
    [cancelBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    cancelBtn.layer.cornerRadius = 5.0f;
    cancelBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    cancelBtn.layer.borderWidth = 1.0f;
    cancelBtn.titleLabel.font = [UIFont systemFontOfSize:buttonFontSize];
    [cancelBtn setTitle:@"忽略提醒" forState:UIControlStateNormal];
    self.cancelBtn = cancelBtn;
    [self addSubview:cancelBtn];
    
    UIButton * stateBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    stateBtn.frame = CGRectMake(width - 40 - 40 - 70 - 3*buttonMargin, (height-kAlertCellBackViewButtonHeight)/2, 40, kAlertCellBackViewButtonHeight);
    [stateBtn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
    stateBtn.layer.cornerRadius = 5.0f;
    stateBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    stateBtn.layer.borderWidth = 1.0f;
    stateBtn.titleLabel.font = [UIFont systemFontOfSize:buttonFontSize];
    [stateBtn setTitle:@"已服" forState:UIControlStateNormal];
    [stateBtn setTitle:@"未服" forState:UIControlStateSelected];
    self.stateBtn = stateBtn;
    [self addSubview:stateBtn];
}

-(void)btnClick:(UIButton *)btn{
    if (btn == self.editBtn) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(animatorBackView:didClickEditorBtn:)]) {
            [self.delegate animatorBackView:self didClickEditorBtn:btn];
        }
    }else if (btn == self.stateBtn){
        if (self.delegate && [self.delegate respondsToSelector:@selector(animatorBackView:didClickStateBtn:)]) {
            [self.delegate animatorBackView:self didClickStateBtn:btn];
        }
    }else if (btn == self.cancelBtn){
        if (self.delegate && [self.delegate respondsToSelector:@selector(animatorBackView:didClickCancelBtn:)]) {
            [self.delegate animatorBackView:self didClickCancelBtn:btn];
        }
    }
}
-(void)closeAlert{
    [UIView animateWithDuration:0.25 animations:^{
        
        self.stateBtn.alpha = 0.0f;
        self.cancelBtn.alpha = 0.0f;
    }];
    
}
-(void)openAlert{
    [UIView animateWithDuration:0.25 animations:^{
        self.stateBtn.alpha = 1.0f;
        self.cancelBtn.alpha = 1.0f;
    }];
    
}
@end
