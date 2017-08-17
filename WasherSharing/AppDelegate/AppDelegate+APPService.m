//
//  AppDelegate+APPService.m
//  Mould
//
//  Created by Jiaming Tu on 2017/4/13.
//  Copyright © 2017年 fujianzhiyou. All rights reserved.
//

#import "AppDelegate+APPService.h"
#import "LaunchIntroductionView.h"

@implementation AppDelegate (APPService)
#pragma  mark - 确认登录状态
//确认登录状态（是否存在token）
- (void)checkLoggingStatusWithToken {
    
}

#pragma  mark - 更改根视图 动画
- (void)restoreRootViewController:(UIViewController *)rootViewController
{
    typedef void (^Animation)(void);
    rootViewController.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    Animation animation = ^{
        BOOL oldState = [UIView areAnimationsEnabled];
        [UIView setAnimationsEnabled:NO];
        [UIApplication sharedApplication].keyWindow.rootViewController = rootViewController;
        [UIView setAnimationsEnabled:oldState];
    };
    
    [UIView transitionWithView:self.window
                      duration:0.5f
                       options:UIViewAnimationOptionTransitionCrossDissolve
                    animations:animation
                    completion:nil];    
}




#pragma  mark - 设置引导页
- (void)setGuidePage {
    CGFloat height = 37 * TJMHeightRatio;
    CGFloat width = 134 * TJMWidthRatio;
    CGRect frame = CGRectMake(TJMScreenWidth / 2 - width / 2 , TJMScreenHeight - 90 *TJMHeightRatio, width, height);
    [LaunchIntroductionView sharedWithImages:@[@"引导页1",@"引导页2",@"引导页3"] buttonImage:@"立即体验" buttonFrame:frame];
}

#pragma mark - 获取当前VC 
- (UIViewController *)topViewController {
    UIViewController *resultVC;
    resultVC = [self _topViewController:[[UIApplication sharedApplication].keyWindow rootViewController]];
    while (resultVC.presentedViewController) {
        resultVC = [self _topViewController:resultVC.presentedViewController];
    }
    return resultVC;
}

- (UIViewController *)_topViewController:(UIViewController *)vc {
    if ([vc isKindOfClass:[UINavigationController class]]) {
        return [self _topViewController:[(UINavigationController *)vc topViewController]];
    } else if ([vc isKindOfClass:[UITabBarController class]]) {
        return [self _topViewController:[(UITabBarController *)vc selectedViewController]];
    } else {
        return vc;
    }
    return nil;
}





@end
