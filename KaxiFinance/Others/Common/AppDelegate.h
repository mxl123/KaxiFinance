//
//  AppDelegate.h
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WLRRoute.h"

@class Reachability;

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) WLRRouter *router;

@end

