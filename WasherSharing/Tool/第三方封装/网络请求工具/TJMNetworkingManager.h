//
//  TJMNetworkingManager.h
//  WasherSharing
//
//  Created by Jiaming Tu on 2017/8/17.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>

typedef void(^NetworkingSuccess)(id successObj,NSString *msg);
typedef void(^NetworkingFailure)(NSInteger code, NSString *failString);
typedef void(^NetworkingProgress)(NSProgress *progress);

@interface TJMNetworkingManager : NSObject

/**GET*/
+ (void)GET:(NSString *)URLString token:(NSString *)token parameters:(NSDictionary *)parameters progress:(NetworkingProgress)progress success:(NetworkingSuccess)success failure:(NetworkingFailure)failure;
/**POST*/
+ (void)POST:(NSString *)URLString token:(NSString *)token parameters:(NSDictionary *)parameters progress:(NetworkingProgress)progress success:(NetworkingSuccess)success failure:(NetworkingFailure)failure;
@end
