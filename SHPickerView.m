//
//  SHPickerView.m
//  smarthome
//
//  Created by 聂海洲 on 2017/5/27.
//  Copyright © 2017年 杭州亚丰信息技术有限公司. All rights reserved.
//

#import "SHPickerView.h"


#define Main_Screen_Width [[UIScreen mainScreen] bounds].size.width

@interface SHPickerView()

//没有处理过的原始的包含数据的数组
@property (nonatomic, strong) NSMutableArray * originSectionArr;
@property (nonatomic, strong) NSMutableArray * sectionArr;

@property (nonatomic, strong) NSMutableArray * componentScales;

@end

@implementation SHPickerView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configSelf];
    }
    return self;
}

- (void)configSelf{
    self.backgroundColor = [UIColor whiteColor];
    self.delegate = self;
    self.dataSource = self;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return ((NSArray *)self.sectionArr[component]).count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return self.sectionArr.count;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    return Main_Screen_Width/((self.sectionArr.count > 1) ? self.sectionArr.count : 1);
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component {
    return 30;
}

- (nullable NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return ((NSArray *)self.sectionArr[component])[row];
}
//- (nullable NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component{
//    return nil;
//}
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(nullable UIView *)view{
//    
//}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
//    NSInteger currentCount = ((NSArray *)self.sectionArr[component]).count;
//    NSInteger currentSacle = [[self.componentScales objectAtIndex:component] integerValue];
//    NSInteger paddingRow = row % (currentCount/(1 + (currentSacle * 2)));
//    NSInteger selectedRow = (paddingRow + (currentCount/(1 + (currentSacle * 2))) * currentSacle);
    
    [pickerView selectRow:row inComponent:component animated:NO];
    
    
}


-(void)selectRow:(NSInteger)row inComponent:(NSInteger)component animated:(BOOL)animated{
    
    NSInteger currentSacle = [[self.componentScales objectAtIndex:component] integerValue];
    NSInteger currentCount = ((NSArray *)self.sectionArr[component]).count;
    NSInteger originCount = (currentCount/(1 + (currentSacle * 2)));
    
    //内部选则中间的一组
    NSInteger paddingRow = row % originCount;
    NSInteger selectedRow = (paddingRow + (currentCount/(1 + (currentSacle * 2))) * currentSacle);
    [super selectRow:selectedRow inComponent:component animated:animated];
    
    //回传出原始数组的索引
    if (self.callback) {
        _callback(paddingRow, component);
    }
}


-(void)SHPickerViewDidSelect:(callback) callback{
    _callback = [callback copy];
}

- (void)addSectionArrs:(NSArray *)firstObj, ...NS_REQUIRES_NIL_TERMINATION{
    static int countNumber = 0;
    va_list argList;
    if (firstObj) {
        va_start(argList, firstObj);
        [self.originSectionArr addObject:firstObj];
        [self.sectionArr addObject:[self stretchArr:firstObj scale:[self.componentScales[countNumber] integerValue]]];
        NSArray *arg = va_arg(argList, id);
        while (arg) {
            countNumber += 1;
            NSArray * arr = [self stretchArr:arg scale:[self.componentScales[countNumber] integerValue]];
            [self.originSectionArr addObject:arg];
            [self.sectionArr addObject:arr];
            arg = va_arg(argList, id);
        }
        va_end(argList);
        countNumber = 0;
    }
}
//- (void)addSectionArrsWithOutOriginArr:(NSArray *)firstObj, ...NS_REQUIRES_NIL_TERMINATION{
//    static int countNumber = 0;
//    va_list argList;
//    if (firstObj) {
//        va_start(argList, firstObj);
//        [self.sectionArr addObject:[self stretchArr:firstObj scale:[self.componentScales[countNumber] integerValue]]];
//        NSArray *arg = va_arg(argList, id);
//        while (arg) {
//            countNumber += 1;
//            NSArray * arr = [self stretchArr:arg scale:[self.componentScales[countNumber] integerValue]];
//            [self.sectionArr addObject:arr];
//            arg = va_arg(argList, id);
//        }
//        va_end(argList);
//        countNumber = 0;
//    }
//}

-(NSMutableArray *)sectionArr{
    if (!_sectionArr) {
        _sectionArr = [NSMutableArray array];
        [_sectionArr removeAllObjects];
    }
    return _sectionArr;
}

-(NSMutableArray *)originSectionArr{
    if (!_originSectionArr) {
        _originSectionArr = [NSMutableArray array];
        [_originSectionArr removeAllObjects];
    }
    return _originSectionArr;
}


-(NSArray *)stretchArr:(NSArray *)array scale:(NSInteger) scale{
    NSMutableArray * tempArray = [NSMutableArray array];
    for (int i = 0; i < array.count * (1 + scale * 2); i++) {
        int j = i % array.count;
        NSString * str = [array objectAtIndex:j];
        if (str.length < 2) {
            str = [@"0" stringByAppendingString:str];
        }
        [tempArray addObject:str];
    }
    
    return [NSArray arrayWithArray:tempArray];
}

- (void) setStretchScale:(NSInteger) scale inComponent:(NSInteger)component{
    if (scale <= 1) {
        scale = 1;
    }
    [self.componentScales replaceObjectAtIndex:component withObject:[NSNumber numberWithInteger:scale]];
    //已经调用过 添加数组 函数 现在要重新刷新一遍数据 这里必须写在 self.componentScales replaceObjectAtIndex:component withObject:[NSNumber numberWithInteger:scale] 交换数据以后
    
    if (self.originSectionArr.count > 0) {
        //对应的数组替换成新的数组
        NSArray * replaceArr = [self stretchArr:self.originSectionArr[component] scale:[self.componentScales[component] integerValue]];
        [self.sectionArr replaceObjectAtIndex:component withObject:replaceArr];
        [self reloadComponent:component];
    }
    
}


-(NSMutableArray *)componentScales{
    if (!_componentScales) {
        _componentScales = [NSMutableArray array];
        for (int i = 0; i< 100; i++) {
            [_componentScales addObject:@1];
        }
    }
    return _componentScales;
}


@end
