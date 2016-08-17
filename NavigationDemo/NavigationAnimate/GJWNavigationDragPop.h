//
//  GJWNavigationDragPop.h
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/17.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GJWNavigationPopAnimate, UINavigationController;
@interface GJWNavigationDragPop : UIPercentDrivenInteractiveTransition

@property (nonatomic, weak) GJWNavigationPopAnimate *pop;

@property (nonatomic, weak) UINavigationController *navigationController;

@property (nonatomic, assign) BOOL interacting;
/** 设置滑动返回的幅度（0~1）默认0.3 */
@property (nonatomic, assign) float progressFinished;
@end
