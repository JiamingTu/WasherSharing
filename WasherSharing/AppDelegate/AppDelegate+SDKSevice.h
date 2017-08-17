//
//  AppDelegate+SDKSevice.h
//  Mould
//
//  Created by Jiaming Tu on 2017/4/11.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate (SDKSevice)<JPUSHRegisterDelegate>

//极光推送
/**注册*/
- (void)registerJPush;
/**设置别名*/
- (void)setAlias;
/**初始化*/
- (void)startJPushWithLaunchOptions:(NSDictionary *)launchOptions;


@end
