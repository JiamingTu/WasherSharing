//
//  TJMNetworkingManager.m
//  WasherSharing
//
//  Created by Jiaming Tu on 2017/8/17.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import "TJMNetworkingManager.h"

#define TJMRightCode [responseObject[@"code"] isEqualToNumber:@(200)]
#define TJMResponseCode [responseObject[@"code"] integerValue]
#define TJMResponseMessage responseObject[@"msg"]
#define TJMUnknownError @"未知错误"
@implementation TJMNetworkingManager

+ (AFHTTPSessionManager *)shareHttpManager {
    static AFHTTPSessionManager *httpManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        httpManager = [AFHTTPSessionManager manager];
        AFJSONResponseSerializer *jsonResponseSerializer = [AFJSONResponseSerializer serializer];
        httpManager.responseSerializer = jsonResponseSerializer;
        httpManager.requestSerializer = [AFHTTPRequestSerializer serializer];
        // 设置超时时间
        [httpManager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
        httpManager.requestSerializer.timeoutInterval = 6.0f;
        [httpManager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    });
    return httpManager;
}
#pragma  mark - 请求
#pragma  mark GET
+ (void)GET:(NSString *)URLString token:(NSString *)token parameters:(NSDictionary *)parameters progress:(NetworkingProgress)progress success:(NetworkingSuccess)success failure:(NetworkingFailure)failure  {
    //配置token
    [self configAuthorization:token];
    [[TJMNetworkingManager shareHttpManager] GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        if (progress) {
            progress(downloadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self requestSuccessWithResponseObject:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error.code,error.localizedDescription);
        }
    }];
}
#pragma  mark POST
+ (void)POST:(NSString *)URLString token:(NSString *)token parameters:(NSDictionary *)parameters progress:(NetworkingProgress)progress success:(NetworkingSuccess)success failure:(NetworkingFailure)failure {
    //配置token
    [self configAuthorization:token];
    [[TJMNetworkingManager shareHttpManager] POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        if (progress) {
            progress(uploadProgress);
        }
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self requestSuccessWithResponseObject:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error.code,error.localizedDescription);
        }
    }];
}
#pragma  mark PUT
+ (void)PUT:(NSString *)URLString token:(NSString *)token parameters:(NSDictionary *)parameters success:(NetworkingSuccess)success failure:(NetworkingFailure)failure {
    [self configAuthorization:token];
    [[TJMNetworkingManager shareHttpManager] PUT:URLString parameters:parameters success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [self requestSuccessWithResponseObject:responseObject success:success failure:failure];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failure) {
            failure(error.code,error.localizedDescription);
        }
    }];
}


#pragma  mark - 公共配置
//是否token
+ (void)configAuthorization:(NSString *)token {
    if (token) {
        [[TJMNetworkingManager shareHttpManager].requestSerializer setValue:token forHTTPHeaderField:@"Authorization"];
    } else {
        [[TJMNetworkingManager shareHttpManager].requestSerializer clearAuthorizationHeader];
    }
}

//网络请求成功后处理结果
+ (void)requestSuccessWithResponseObject:(id)responseObject success:(NetworkingSuccess)success failure:(NetworkingFailure)failure {
    if (TJMRightCode) {
        if (success) {
            success(responseObject,TJMResponseMessage);
        }
    } else if ([TJMResponseMessage isEqual:[NSNull null]]) {
        if (failure) {
            failure(TJMResponseCode,TJMUnknownError);
        }
    } else {
        if (failure) {
            failure(TJMResponseCode,TJMResponseMessage);
        }
    }
}

@end
