//
//  NSString+Extension.m
//  PersonalClinic
//
//  Created by nhz on 16/1/29.
//  Copyright © 2016年 loncn01. All rights reserved.
//

#import "NSString+Extension.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Extension)

+(NSString *)documentPathWith:(NSString *)fileName{
    return [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)lastObject] stringByAppendingPathComponent:[NSString stringWithFormat:@"%@",fileName]];
}

- (NSString *)md5String
{
    const char *original_str = [self UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(original_str, strlen(original_str), result);
    NSMutableString *hash = [NSMutableString string];
    for (int i = 0; i < 16; i++){
        [hash appendFormat:@"%02X", result[i]];
    }
    return [hash lowercaseString];
}

- (NSString *)URLEncodedString{
    
    NSString *encodedString = (NSString *)
    CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes (kCFAllocatorDefault,(CFStringRef)self,(CFStringRef)@"!$&'()*+,-./:;=?@_~%#[]", NULL, kCFStringEncodingUTF8));
    return encodedString;
}


//检测是否是手机号码
- (BOOL)isMobileNumber{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     10         * 中国移动：China Mobile
     11         * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     12         */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     15         * 中国联通：China Unicom
     16         * 130,131,132,152,155,156,185,186
     17         */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     20         * 中国电信：China Telecom
     21         * 133,1349,153,180,189
     22         */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     25         * 大陆地区固话及小灵通
     26         * 区号：010,020,021,022,023,024,025,027,028,029
     27         * 号码：七位或八位
     28         */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:self] == YES) || ([regextestcm evaluateWithObject:self] == YES) || ([regextestct evaluateWithObject:self] == YES) || ([regextestcu evaluateWithObject:self] == YES)){
        
        return YES;
    } else {
        return NO;
    }
}


+(NSString*)stringJsonFromDic:(NSDictionary *)dic
{
    NSError *parseError = nil;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dic options:NSJSONWritingPrettyPrinted error:&parseError];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

-(BOOL)isChinese{
    NSString *match=@"(^[\u4e00-\u9fa5]+$)";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF matches %@", match];
    return [predicate evaluateWithObject:self];
}
+(NSString *)base64StringFromImage:(UIImage *)image{
    
    NSData *data1=UIImageJPEGRepresentation(image, 0.1);
    return [data1 base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    NSString * baseStr = nil;
    NSData *data=UIImageJPEGRepresentation(image, 0.1);
    baseStr = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    baseStr = (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)baseStr,NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    return baseStr;
}

+(NSString *)trslateDateFormateHorizontalLinetoBackslash:(NSString *)str{
    NSArray * dateArr = [str componentsSeparatedByString:@"-"];
    NSMutableArray * mutArr = [NSMutableArray arrayWithArray:dateArr];
    for (int i= 0; i< mutArr.count; i++) {
        if ([mutArr[i] isEqualToString:@""]) {
            [mutArr removeObjectAtIndex:i];
        }
    }
    return [mutArr componentsJoinedByString:@" / "];
}
+(NSString *)trslateDateFormateBackslashLinetoHorizontal:(NSString *)str{
    NSArray * dateArr = [str componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" /"]];
    NSMutableArray * mutArr = [NSMutableArray arrayWithArray:dateArr];
    for (int i= 0; i< mutArr.count; i++) {
        if ([mutArr[i] isEqualToString:@""]) {
            [mutArr removeObjectAtIndex:i];
        }
    }
    return [mutArr componentsJoinedByString:@"-"];
}

@end
