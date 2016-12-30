//
//  ScanCardViewController.h
//  OCR_SavingCard
//
//  Created by linyingwei on 16/5/5.
//  Copyright © 2016年 linyingwei. All rights reserved.
//

/*
 扫描银行卡
 */

#import <UIKit/UIKit.h>

typedef void (^ResultBlock)(NSString* cardNumber, NSString *bank, UIImage *image);

@interface ScanCardViewController : UIViewController
/*
 扫描回调
 示例：
 ScanCardViewController *scanCardVC = [[ScanCardViewController alloc] init];
 [scanCardVC achieveResult:^(NSString *cardNumber, NSString *bank, UIImage *image) {
    dispatch_async(dispatch_get_main_queue(), ^{
    }
 }];
 */
- (void)achieveResult:(ResultBlock)block;

@end
