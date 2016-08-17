//
//  BaseViewController.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/6/29.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController () 

@end
@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // 
    self.edgesForExtendedLayout = UIRectEdgeNone;
}

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (UIColor *)navigationBarInColor {
    return nil;
}

- (UIColor *)navigationBarOutColor {
    return nil;
}



@end
