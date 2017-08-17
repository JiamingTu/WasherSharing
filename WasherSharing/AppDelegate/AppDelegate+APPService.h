//
//  AppDelegate+APPService.h
//  Mould
//
//  Created by Jiaming Tu on 2017/4/13.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import "AppDelegate.h"

typedef void(^AppSerFailBlock)(NSString *failMsg);

@interface AppDelegate (APPService)<TDAlertViewDelegate>
/*
 *验证登录状态并进入相应界面
 */
- (void)checkLoggingStatusWithToken;

/*
 * 更改根视图时的淡出动画
 * @param rootViewController 将要跳转的rootViewController
 */
- (void)restoreRootViewController:(UIViewController *)rootViewController;

/**设置引导页*/
- (void)setGuidePage;

/**获取当前视图控制器*/
- (UIViewController *)topViewController;

@end
