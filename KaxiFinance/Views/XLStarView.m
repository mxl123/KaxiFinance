//
//  XLStarView.m
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import "XLStarView.h"
#import "KaxiHeader.h"

@interface XLStarView ()
@property (nonatomic, strong) UIImageView *bgImageView;
@end

@implementation XLStarView

+ (instancetype)startView {
    NSString *bgIMGName = nil;
    
    if (kDevice_Is_iPhone4 || [[UIDevice currentDevice].model isEqualToString:@"iPad"]) {
        bgIMGName = @"启动页640,960";
    } else if (kDevice_Is_iPhone5) {
        bgIMGName = @"启动页640,1136";
    } else if (kDevice_Is_iPhone6) {
        bgIMGName = @"启动页750,1334";
    } else if (kDevice_Is_iPhone6Plus) {
        bgIMGName = @"启动页1242,2208";
    }
    UIImage *image = [UIImage imageNamed:bgIMGName];
    return [[self alloc] initWithBgImage:image];
}

- (instancetype)initWithBgImage:(UIImage *)bgImage {
    self = [super initWithFrame:kScreen_Bounds];
    if (self) {
        self.bgImageView = [[UIImageView alloc] initWithFrame:kScreen_Bounds];
        self.bgImageView.contentMode = UIViewContentModeScaleAspectFill;
        self.bgImageView.image = bgImage;
        self.bgImageView.alpha = 0.0f;
        [self addSubview:self.bgImageView];
    }
    return self;
}

- (void)startAnimationWithCompletionBlock:(void(^)(XLStarView *easeStartView))completionHandler {
    [kKeyWindow addSubview:self];
    [kKeyWindow bringSubviewToFront:self];
    self.bgImageView.alpha = 1.0f;
    WEAK_SELF;
    [UIView animateWithDuration:2.0 animations:^{
        STRONG_SELF;
        self.bgImageView.alpha = 1.0;
        
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.6 delay:0.6 options:UIViewAnimationOptionCurveEaseIn animations:^{
            STRONG_SELF;
            self.bgImageView.alpha = 0.0;
            //            [self setX:-kScreen_Width];
        } completion:^(BOOL finished) {
            STRONG_SELF;
            [self removeFromSuperview];
            if (completionHandler) {
                completionHandler(self);
            }
        }];
    }];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
