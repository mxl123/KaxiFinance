//
//  XLTabBarViewController.m
//  KaxiFinance
//
//  Created by mxl on 2016/12/19.
//  Copyright © 2016年 Meloinfo. All rights reserved.
//

#import "XLTabBarViewController.h"
#import "KaxiHeader.h"
#import "XLNavigationViewController.h"

@interface XLTabBarViewController ()<UITabBarDelegate, UITabBarControllerDelegate>

@end

@implementation XLTabBarViewController

#pragma mark - 第一次使用当前类的时候对设置UITabBarItem的主题

+ (void)initialize
{
    UITabBarItem *tabBarItem = [UITabBarItem appearanceWhenContainedInInstancesOfClasses:@[self]];
    
    NSMutableDictionary *dictNormal = [NSMutableDictionary dictionary];
    dictNormal[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#cccccc"];
    dictNormal[NSFontAttributeName] = [UIFont systemFontOfSize:9*WIDTH_NIT];
    
    NSMutableDictionary *dictSelected = [NSMutableDictionary dictionary];
    dictSelected[NSForegroundColorAttributeName] = [UIColor colorWithHexString:@"#1a1a1a"];
    dictSelected[NSFontAttributeName] = [UIFont systemFontOfSize:9*WIDTH_NIT];
    
    [tabBarItem setTitleTextAttributes:dictNormal forState:UIControlStateNormal];
    [tabBarItem setTitleTextAttributes:dictSelected forState:UIControlStateSelected];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [[UITabBar appearance] setBarTintColor:[UIColor whiteColor]];
    [UITabBar appearance].translucent = NO;
    self.delegate = self;
}

- (void)setUpOneChildVcWithVc:(UIViewController *)Vc Image:(NSString *)image selectedImage:(NSString *)selectedImage title:(NSString *)title tag:(NSInteger)tag{
    XLNavigationViewController *nav = [[XLNavigationViewController alloc] initWithRootViewController:Vc];
    
    Vc.view.backgroundColor = [UIColor whiteColor];
    
    UIImage *myImage = [UIImage imageNamed:image];
    
    myImage = [myImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.image = myImage;
    
    UIImage *mySelectedImage = [UIImage imageNamed:selectedImage];
    
    mySelectedImage = [mySelectedImage imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    Vc.tabBarItem.selectedImage = mySelectedImage;
    
    Vc.tabBarItem.title = title;
    Vc.tabBarItem.tag =tag;
    Vc.navigationItem.title = title;
    
    [self addChildViewController:nav];
}


- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController {
    
    if (viewController.tabBarItem.tag == 2) {
    
    }
    return YES;
}

@end
