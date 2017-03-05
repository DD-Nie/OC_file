//
//  HzTagsViewConfig.m
//  HzTagViews
//
//  Created by nhz on 16/3/27.
//  Copyright © 2016年 nhz. All rights reserved.
//

#import "HzTagsViewConfig.h"

@interface HzTagsViewConfig()

@end

@implementation HzTagsViewConfig

-(NSMutableArray *)sectionsTitle{
    if (!_sectionsTitle){
        _sectionsTitle = [NSMutableArray array];
    }
    return _sectionsTitle;
}
-(NSMutableArray *)sectionsArr{
    if (!_sectionsArr) {
        _sectionsArr = [NSMutableArray array];
    }
    return _sectionsArr;
}

- (void)addSectionArrs:(NSMutableArray *)firstObj, ...NS_REQUIRES_NIL_TERMINATION{
    va_list argList;
    if (firstObj) {
        va_start(argList, firstObj);
        [self.sectionsArr addObject:firstObj];
        NSMutableArray *arg = va_arg(argList, id);
        while (arg) {
            [self.sectionsArr addObject:arg];
            arg = va_arg(argList, id);
        }
        va_end(argList);
    }
}

- (void)addSectionTitles:(NSString *)firstTitle, ...NS_REQUIRES_NIL_TERMINATION{
    va_list argList;
    if (firstTitle) {
        va_start(argList, firstTitle);
        [self.sectionsTitle addObject:firstTitle];
        NSMutableArray *arg = va_arg(argList, id);
        while (arg) {
            [self.sectionsTitle addObject:arg];
            arg = va_arg(argList, id);
        }
        va_end(argList);
    }
}

//解释：
//va_start(ap,param)：指向第一个可变参数的地址
//va_list argList:定义一个va_list变量
//va_arg(ap,type)：ap指向下一个参数的地址
//va_end(ap)：清除参数



@end
