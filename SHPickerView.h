//
//  SHPickerView.h
//  smarthome
//
//  Created by 聂海洲 on 2017/5/27.
//  Copyright © 2017年 杭州亚丰信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^callback) (NSInteger selectedRow, NSInteger component);

@class SHPickerView;

@interface SHPickerView : UIPickerView<UIPickerViewDelegate, UIPickerViewDataSource>

@property (nonatomic, copy) callback callback;


/**
 pickerView 选中回调
 */
-(void)SHPickerViewDidSelect:(callback) callback;


/**
 向 pickerView 添加分组
 */
- (void) addSectionArrs:(NSArray *)firstObj, ...NS_REQUIRES_NIL_TERMINATION;


/**
 设置上下复制的数组的倍数 默认是1 最小值为1
 
 @param scale 倍数
 @param component 分组
 */
-(void) setStretchScale:(NSInteger) scale inComponent:(NSInteger)component;

@end
