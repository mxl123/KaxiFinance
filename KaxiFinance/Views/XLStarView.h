//
//  XLStarView.h
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XLStarView : UIView

+ (instancetype)startView;

- (void)startAnimationWithCompletionBlock:(void(^)(XLStarView *easeStartView))completionHandler;

@end
