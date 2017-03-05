//
//  HzNetManager.m
//  PersonalClinic
//
//  Created by nhz on 16/3/30.
//  Copyright © 2016年 loncn01. All rights reserved.
//

#import "HzNetManager.h"
#import "AFNetworking.h"
#import "HzNetRequest.h"
#import "LYSingle.h"
#import "NSString+Extension.h"
#import "MBProgressHUD+Add.h"

@implementation HzNetManager


+ (instancetype)shareManager{
    static HzNetManager * manager = nil;
    dispatch_once_t once;
    dispatch_once(&once, ^{
        manager = [[HzNetManager alloc] init];
    });
    NSLog(@"%p", manager);
    return manager;
}

+ (void)POST:(NSString *)urlStr parameters:(NSMutableDictionary*)param timeoutInterVal:(NSTimeInterval)timeout success:(void(^)(AFHTTPRequestOperation *operation, id responseObject))success failure:(void(^)(AFHTTPRequestOperation *operation, NSError *error))failure{
    
    NSMutableDictionary * header = [NSMutableDictionary dictionaryWithObjects:@[[[LYSingle sharedSingle] CFBundleVersion], [[LYSingle sharedSingle] sysUserId], @"40288c2a50b2b9b20150b2bbfe7e0001"] forKeys:@[@"v",@"sysUserId",@"clinicId"]];
    NSMutableDictionary * content = [NSMutableDictionary dictionaryWithObject:@{} forKey:@"content"];
    NSDictionary * code = @{};
    NSMutableDictionary * body = [NSMutableDictionary dictionaryWithObjects:@[param, content, code] forKeys:@[@"param", @"content", @"code"]];
    NSMutableDictionary * detail = [NSMutableDictionary dictionaryWithObjects:@[body, header] forKeys:@[@"body", @"header"]];
    NSMutableDictionary * dicc = [NSMutableDictionary dictionary];
    dicc[@"detail"] = [NSString stringJsonFromDic:detail];
    
    
    AFHTTPRequestOperationManager *mar = [AFHTTPRequestOperationManager manager];
    mar.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];
    [mar.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    mar.requestSerializer.timeoutInterval = timeout;
    [mar.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    
    [mar POST:urlStr parameters:dicc success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(operation, responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failure(operation, error);
        
    }];
}




@end
