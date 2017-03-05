//
//  UIImage+HzExtension.h
//  First
//
//  Created by nhz on 15/11/23.
//  Copyright © 2015年 nhz. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (HzExtension)
+(UIImage *)imageStretchImage:(NSString * )name;
-(NSString *)imageConvertToBase64String:(UIImage *)image;

@end
