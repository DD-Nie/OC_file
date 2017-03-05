//
//  HzBarButtonItem.h
//  PersonalClinic
//
//  Created by nhz on 16/3/21.
//  Copyright © 2016年 loncn01. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HzBarButtonItem : UIBarButtonItem

+(UIBarButtonItem *)hz_itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
+(UIBarButtonItem *)hz_itemWithImageName:(NSString *)imageName target:(id)target action:(SEL)action;

@end
