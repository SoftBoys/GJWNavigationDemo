//
//  UINavigationPopTransition.h
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/16.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface GJWNavigationPopAnimate : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign) BOOL animating;
@end
