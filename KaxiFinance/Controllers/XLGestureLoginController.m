//
//  XLGestureLoginController.m
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import "XLGestureLoginController.h"

@interface XLGestureLoginController ()

@end

@implementation XLGestureLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)configLockView {
    [super configLockView];
    
    [self.lockView setType:CircleViewTypeLogin];
    // 管理手势密码
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self creatButton:leftBtn frame:CGRectMake(CircleViewEdgeMargin + 20, kScreenH - 60, kScreenW/2, 20) title:@"管理手势密码" alignment:UIControlContentHorizontalAlignmentLeft tag:buttonTagManager];
    
    // 登录其他账户
    UIButton *rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self creatButton:rightBtn frame:CGRectMake(kScreenW/2 - CircleViewEdgeMargin - 20, kScreenH - 60, kScreenW/2, 20) title:@"登陆其他账户" alignment:UIControlContentHorizontalAlignmentRight tag:buttonTagForget];
}

#pragma mark - 创建UIButton
- (void)creatButton:(UIButton *)btn frame:(CGRect)frame title:(NSString *)title alignment:(UIControlContentHorizontalAlignment)alignment tag:(NSInteger)tag
{
    btn.frame = frame;
    btn.tag = tag;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setContentHorizontalAlignment:alignment];
    [btn.titleLabel setFont:[UIFont systemFontOfSize:14.0f]];
    [btn addTarget:self action:@selector(didClickBtn:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

#pragma mark - CircleViewDelegate

- (void)circleView:(PCCircleView *)view type:(CircleViewType)type didCompleteLoginGesture:(NSString *)gesture result:(BOOL)equal {
    
    if (equal) {
        NSLog(@"success");
    } else {
        NSLog(@"error");
        [self.msgLabel showWarnMsgAndShake:gestureTextGestureVerifyError];
    }
}

#pragma mark - button点击事件
- (void)didClickBtn:(UIButton *)sender {
    NSLog(@"%ld", (long)sender.tag);
    switch (sender.tag) {
        case buttonTagReset: {
            NSLog(@"点击了重设按钮");
            // 1.隐藏按钮
            [self.resetBtn setHidden:YES];
            
            // 2.infoView取消选中
            [self infoViewDeselectedSubviews];
            
            // 3.msgLabel提示文字复位
            [self.msgLabel showNormalMsg:gestureTextBeforeSet];
            
            // 4.清除之前存储的密码
            [PCCircleViewConst saveGesture:nil Key:gestureOneSaveKey];
        }
            break;
        case buttonTagManager: {
            NSLog(@"点击了管理手势密码按钮");
        }
            break;
        case buttonTagForget:
            NSLog(@"点击了登录其他账户按钮");
            break;
        default:
            break;
    }
}

@end
