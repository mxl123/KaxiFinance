//
//  LOGIN.m
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import "LOGIN.h"

@implementation LOGIN


+ (BOOL)isLogin {
    if ([[[NSUserDefaults standardUserDefaults] objectForKey:@""] isEqualToString:@""]) {
        return YES;
    }
    return NO;
}

@end
