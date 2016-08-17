//
//  GJWNavigation.h
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/16.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GJWNavigation : NSObject

/** 将需要使用自定义导航的导航控制器加入进去 */
- (void)joinToNavigationController:(UINavigationController *)navigationController;
/** 设置滑动返回的幅度（0~1）默认0.3 */ 
@property (nonatomic, assign) float progressFinished;

@end
