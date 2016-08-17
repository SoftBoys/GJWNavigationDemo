//
//  ViewController.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/6/29.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "ViewController.h"
#import "SecondViewController.h"
#import "UINavigationBar+Color.h"
#import "GJWNavigation.h"

@interface ViewController ()
@property (nonatomic, strong) GJWNavigation *navigation;
@end

@implementation ViewController

- (UIStatusBarStyle)preferredStatusBarStyle {
    return UIStatusBarStyleLightContent;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.edgesForExtendedLayout = UIRectEdgeAll;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor orangeColor];
    [button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [self.view addSubview:button];
    button.frame = CGRectMake(100, 100, 80, 80);
    
    
    self.navigationItem.title = @"Fir Controller";
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc]init];
    backItem.title = @"";
    self.navigationItem.backBarButtonItem = backItem;
    
    // 设置navigationBar的背景色 (仅仅在根视图控制器中设置一次即可)
    UINavigationBar *bar = [self.navigationController navigationBar];
    [bar gjw_setBackgroundColor:[self navigationBarInColor]];
    
    self.view.backgroundColor = [UIColor colorWithRed:0.972 green:0.394 blue:0.294 alpha:1.000];
    
}
// 设置从其他页面到该页面的导航颜色
- (UIColor *)navigationBarInColor {
    return [UIColor clearColor];
}
- (void)buttonClick {
    
    SecondViewController *second = [SecondViewController new];
    
    [self.navigationController pushViewController:second animated:YES];
    
}

@end
