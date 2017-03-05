//
//  NSString+Extension.h
//  PersonalClinic
//
//  Created by nhz on 16/1/29.
//  Copyright © 2016年 loncn01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Extension)

+ (NSString*)stringJsonFromDic:(NSDictionary *)dic;
- (BOOL)isChinese;
- (BOOL)isMobileNumber;
- (NSString *)URLEncodedString;
- (NSString *)md5String;
+ (NSString *)documentPathWith:(NSString *)fileName;
+ (NSString *)base64StringFromImage:(UIImage *)image;

+ (NSString *)trslateDateFormateHorizontalLinetoBackslash:(NSString *)str;
+ (NSString *)trslateDateFormateBackslashLinetoHorizontal:(NSString *)str;
@end
