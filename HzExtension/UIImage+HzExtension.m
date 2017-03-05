//
//  UIImage+HzExtension.m
//  First
//
//  Created by nhz on 15/11/23.
//  Copyright © 2015年 nhz. All rights reserved.
//

#import "UIImage+HzExtension.h"

@implementation UIImage (HzExtension)

+(UIImage *)imageStretchImage:(NSString * )name{
    UIImage * image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

-(NSString *)imageConvertToBase64String:(UIImage *)image{
    
    NSData *data1=UIImageJPEGRepresentation(image, 0.1);
    return [data1 base64EncodedStringWithOptions:NSDataBase64Encoding64CharacterLineLength];
    
    
    NSString * baseStr = nil;
    NSData *data=UIImageJPEGRepresentation(image, 0.1);
    baseStr = [data base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed];
    baseStr = (__bridge NSString *) CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault, (CFStringRef)baseStr,NULL, CFSTR(":/?#[]@!$&’()*+,;="), kCFStringEncodingUTF8);
    return baseStr;
}


@end
