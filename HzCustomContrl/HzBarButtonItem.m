//
//  HzBarButtonItem.m
//  PersonalClinic
//
//  Created by nhz on 16/3/21.
//  Copyright © 2016年 loncn01. All rights reserved.
//

#import "HzBarButtonItem.h"
#import "NHZ.h"

@implementation HzBarButtonItem

+(UIBarButtonItem *)hz_itemWithTitle:(NSString *)title target:(id)target action:(SEL)action{

    UIButton *titleBtnItem = [UIButton buttonWithType:UIButtonTypeCustom];
    titleBtnItem.size = CGSizeMake(40, 30);
    [titleBtnItem setTitle:title forState:UIControlStateNormal];
    [titleBtnItem setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    titleBtnItem.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [titleBtnItem addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:titleBtnItem];
    
}
+(UIBarButtonItem *)hz_itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action{
    UIButton *imageBtnItem = [UIButton buttonWithType:UIButtonTypeCustom];
    imageBtnItem.size = CGSizeMake(12, 17);
    [imageBtnItem setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [imageBtnItem addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return [[UIBarButtonItem alloc] initWithCustomView:imageBtnItem];
}

@end
