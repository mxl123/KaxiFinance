//
//  AppDelegate.m
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import "AppDelegate.h"
#import "XLStarView.h"
#import "XLTabBarViewController.h"
#import "KaxiDefine.h"
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "XLCommonHandler.h"

@interface AppDelegate ()
@property (nonatomic, strong) Reachability *reachability;
@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // 配置根视图控制器
    [self configWindowRootViewsWithOptions:launchOptions];
    
    // 启动动画
    XLStarView *starView = [XLStarView startView];
    WEAK_SELF;
    [starView startAnimationWithCompletionBlock:^(XLStarView *easeStartView) {
        STRONG_SELF;
        [self completionStartAnimationWithApplication:application Options:launchOptions];
    }];
    
    return YES;
}

- (void)configWindowRootViewsWithOptions:(NSDictionary *)launchOptions {

    self.router = [WLRRouter new];
    
    // 注册跳转协议
    [self.router registerHandler:XL_COMMON_HANDLER
                        forRoute:TO_LOGIN];
    [self.router registerHandler:XL_COMMON_HANDLER
                        forRoute:TO_REGIS];
    
    
    XLTabBarViewController *tabBar = [XLTabBarViewController new];
    
    self.window.rootViewController = tabBar;
    
    [self.window makeKeyAndVisible];
}

- (void)completionStartAnimationWithApplication:(UIApplication *)application Options:(NSDictionary *)launchOptions {
}

- (void)configureReachability {

}


@end
