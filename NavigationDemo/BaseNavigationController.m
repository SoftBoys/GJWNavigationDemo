//
//  BaseNavigationController.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/15.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "BaseNavigationController.h"
#import "UINavigationBar+Color.h"
#import "GJWNavigation.h"

@interface BaseNavigationController () <UIGestureRecognizerDelegate>
@property (nonatomic, strong) GJWNavigation *navigation;
@end

@implementation BaseNavigationController

+ (void)initialize {
    
    [super initialize];
    
    UINavigationBar *bar = [UINavigationBar appearance];
    
    UIImage *image = [UIImage imageNamed:@"v2_goback"];
    image = [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    bar.backIndicatorImage = image;
    bar.backIndicatorTransitionMaskImage = image;

    bar.tintColor = [UIColor blueColor];
    
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]}];
    
//    bar.barTintColor = [UIColor orangeColor]; // 设置导航栏背景色
//    bar.translucent = NO;
//    [bar gjw_setBackgroundColor:[UIColor redColor]];
}
- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.interactivePopGestureRecognizer.delegate = self;
    
    // 在根视图控制器中初始化一次即可， 注意：要设置为成员属性,否则不起作用
    GJWNavigation *navigation = [[GJWNavigation alloc] init];
    navigation.progressFinished = 0.5;
    [navigation joinToNavigationController:self];
    self.navigation = navigation;
}

#pragma mark - UIGestureRecognizerDelegate
#pragma mark - 开启右滑返回，当滑动到根视图把右滑关闭
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {

    NSInteger count = self.viewControllers.count;
    if (count == 1) {
        return NO;
    } else {
        return YES;
    }
}

@end
