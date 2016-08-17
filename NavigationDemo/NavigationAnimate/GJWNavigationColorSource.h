//
//  GJWNavigationColorSource.h
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/17.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class UIColor;
@protocol GJWNavigationColorSource <NSObject>

@optional
- (UIColor *)navigationBarInColor;
- (UIColor *)navigationBarOutColor;

@end
