//
//  IDCartViewController.h
//  BankCard
//
//  Created by XAYQ-FanXL on 16/7/11.
//  Copyright © 2016年 AN. All rights reserved.
//

// 扫描身份证
#import <UIKit/UIKit.h>
#import "IDInfo.h"

typedef void (^ResultBlock)(IDInfo* idInfo, UIImage *image);

@interface IDCartViewController : UIViewController

/*
 扫描回调
 示例：
 IDCartViewController *idCardVC = [[IDCartViewController alloc] init];
 [idCardVC achieveResult:^(IDInfo *idInfo, UIImage *image) {
    dispatch_async(dispatch_get_main_queue(), ^{
    }
 });
 }];
 */
- (void)achieveResult:(ResultBlock)block;

@end
