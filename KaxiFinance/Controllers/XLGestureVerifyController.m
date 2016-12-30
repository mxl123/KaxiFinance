//
//  XLGestureVerifyController.m
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import "XLGestureVerifyController.h"

@interface XLGestureVerifyController ()

@end

@implementation XLGestureVerifyController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)configLockView {
    [super configLockView];
}

#pragma mark - CircleViewDelegate
- (void)circleView:(PCCircleView *)view type:(CircleViewType)type didCompleteLoginGesture:(NSString *)gesture result:(BOOL)equal
{
    if (type == CircleViewTypeVerify) {
        
        if (equal) {
            NSLog(@"验证成功");
        } else {
            NSLog(@"密码错误！");
            [self.msgLabel showWarnMsgAndShake:gestureTextGestureVerifyError];
        }
    }
}


@end
