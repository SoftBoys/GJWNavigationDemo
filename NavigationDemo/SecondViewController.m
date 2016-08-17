//
//  SecondViewController.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/6/29.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "SecondViewController.h"

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"Second Controller";
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    /* 
     特别注意:
     当该页面的导航颜色为透明色时，要设置 self.edgesForExtendedLayout = UIRectEdgeAll;
     与该页面的相邻的页面的edgesForExtendedLayout != UIRectEdgeNone
     也就是说当导航透明的时候，我们要保证view的(x,y)坐标是从(0,0)位置开始的，而不是以(0.64)开始的
     */
    
}
// 设置从其他页面到该页面的导航颜色
- (UIColor *)navigationBarInColor {
    return [UIColor clearColor];
//    return [UIColor colorWithRed:0.972 green:0.394 blue:0.294 alpha:1.000];
//    return [UIColor colorWithRed:0.018 green:0.028 blue:0.023 alpha:0.777];
}

@end
