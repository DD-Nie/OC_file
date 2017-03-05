//
//  HzResponderBtn.h
//  play
//
//  Created by nhz on 16/1/25.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HzResponderBtn;
@protocol HzResponderBtnDelegate <NSObject>

-(void)hz_responderBtn:(HzResponderBtn *)btn accessoryViewSelectConfirm:(NSString *)name;
-(void)hz_responderBtnAccessoryViewSelectCancel:(HzResponderBtn *)btn;

@end



@interface HzResponderBtn : UIButton<UIPickerViewAccessibilityDelegate, UIPickerViewDataSource, UIPickerViewDelegate>

@property(strong,nonatomic,readwrite) UIToolbar *inputAccessoryView;
@property(strong,nonatomic,readwrite) UIPickerView *inputView;

@property (nonatomic, assign)id <HzResponderBtnDelegate> delegate;

@end
