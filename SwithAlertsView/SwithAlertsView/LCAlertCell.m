//
//  LCAlertCell.m
//  UICollectionView
//
//  Created by nhz on 16/6/3.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "LCAlertCell.h"
@interface LCAlertCell() <AnimatorBackViewDelegate>

@end


@implementation LCAlertCell{
//    JTMaterialSwitch *jtSwitch;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createContentSubViews];
        
        [self configData];
    }
    return self;
}
-(void)createContentSubViews{
    
    CGRect contentBounds = self.contentView.bounds;
    
    UILabel * alertTime = [[UILabel alloc] initWithFrame:CGRectMake(10, 10, 40, 30)];
    alertTime.text = @"8:00";
    alertTime.textColor = [UIColor blackColor];
    alertTime.backgroundColor = [UIColor lightGrayColor];
    alertTime.layer.cornerRadius = 10.0f;
    [self.contentView addSubview:alertTime];
    
    self.switchBtn = [[MBSwitch alloc] initWithFrame:CGRectMake(contentBounds.size.width - 45, 10, 35.0, 38.0)];
    [self.switchBtn setTintColor:[UIColor colorWithRed:0.58f green:0.65f blue:0.65f alpha:1.00f]];
    [self.switchBtn setOnTintColor:[UIColor colorWithRed:0.91f green:0.30f blue:0.24f alpha:1.00f]];
    [self.switchBtn setOffTintColor:[UIColor colorWithRed:0.93f green:0.94f blue:0.95f alpha:1.00f]];
    [self.switchBtn setOn:YES];
    [self.switchBtn addTarget:self action:@selector(stateChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:self.switchBtn];
    
}
-(void)stateChanged:(UISwitch *)sender{
    if (sender.isOn) {
        [self.animaView.backView openAlert];
    }else{
        [self.animaView.backView closeAlert];
    }
}
-(void)configData{
    self.animaView.backView.delegate = self;
}

#pragma mark -
#pragma mark - AnimatorBackViewDeleagte
-(void)animatorBackView:(AnimatorBackView *)backView didClickCancelBtn:(UIButton *)btn{
    
}
-(void)animatorBackView:(AnimatorBackView *)backView didClickEditorBtn:(UIButton *)btn{
    if (self.delegate && [self.delegate respondsToSelector:@selector(LCAlertCellDidClickEditBtn:)]) {
        [self.delegate LCAlertCellDidClickEditBtn:self];
    }
}
-(void)animatorBackView:(AnimatorBackView *)backView didClickStateBtn:(UIButton *)btn{
    btn.selected = !btn.selected;
}
@end
