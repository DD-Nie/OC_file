//
//  HzNetManager.h
//  PersonalClinic
//
//  Created by nhz on 16/3/30.
//  Copyright © 2016年 loncn01. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface HzNetManager : NSObject

+ (void)POST:(NSString *)urlStr parameters:(NSMutableDictionary*)param timeoutInterVal:(NSTimeInterval)timeout success:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure;

@end
