//
//  BaseViewController.h
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/6/29.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GJWNavigationColorSource.h"

@interface BaseViewController : UIViewController <GJWNavigationColorSource>

@property (nonatomic, weak) id<GJWNavigationColorSource> colorSource;

@end
