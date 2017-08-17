//
//  TJMAppKey.h
//  Mould
//
//  Created by Jiaming Tu on 2017/6/28.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#ifndef TJMAppKey_h
#define TJMAppKey_h
//微信
//开户邮件中的（公众账号APPID或者应用APPID）
#define TJM_WX_AppID @""


//极光推送
#define TJMJPushAppKey @""

static NSString *JPushChannel = @"Publish channel";
// static BOOL JPushIsProduction = NO;
#ifdef DEBUG
// 开发 极光FALSE为开发环境
static BOOL const JPushIsProduction = NO;
#else
// 生产 极光TRUE为生产环境
static BOOL const JPushIsProduction = YES;
#endif

#define AppleID @"1264354327"

#endif /* TJMAppKey_h */
