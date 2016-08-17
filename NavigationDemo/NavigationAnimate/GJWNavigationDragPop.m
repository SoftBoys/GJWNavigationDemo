//
//  GJWNavigationDragPop.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/17.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "GJWNavigationDragPop.h"
#import "GJWNavigationPopAnimate.h"

@interface GJWNavigationDragPop ()

@end
@implementation GJWNavigationDragPop

- (instancetype)init {
    self = [super init];
    self.interacting = NO;
    self.progressFinished = 0.3;
    return self;
}

- (void)setNavigationController:(UINavigationController *)navigationController {
    _navigationController = navigationController;
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
    [_navigationController.view addGestureRecognizer:pan];
    
//    // 类似于系统从左侧滑动返回
//    UIScreenEdgePanGestureRecognizer *edgePan = [[UIScreenEdgePanGestureRecognizer alloc] initWithTarget:self action:@selector(handlePan:)];
//    edgePan.edges = UIRectEdgeLeft;
//    [_navigationController.view addGestureRecognizer:edgePan];
}


- (void)handlePan:(UIPanGestureRecognizer *)pan {
    
    CGPoint offset = [pan translationInView:pan.view];
    // 速度
    CGPoint velocity = [pan velocityInView:pan.view];
    
//    NSLog(@"offset:%@---velocity:%@", NSStringFromCGPoint(offset), NSStringFromCGPoint(velocity));
    
    float progress = offset.x / pan.view.bounds.size.width;
    progress = MIN(1.0, MAX(progress, 0.0));

    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
        {
            if (!self.pop.animating) {
                
                self.interacting = YES;
                if (velocity.x > 0 && self.navigationController.viewControllers.count > 1) {
                    [self.navigationController popViewControllerAnimated:YES];
                }
            }
            
        }
            break;
            
        case UIGestureRecognizerStateChanged:
        {
            if (self.interacting) {

                [self updateInteractiveTransition:progress];
            }
        }
            break;
        case UIGestureRecognizerStateEnded:
        {
            if (self.interacting) {
                
                if (progress > self.progressFinished) { // 滑动幅度
                    [self finishInteractiveTransition];
                } else {
                    [self cancelInteractiveTransition];
                }
                self.interacting = NO;
            }

        }
            break;
        case UIGestureRecognizerStateCancelled:
        {
            if (self.interacting) {
                [self cancelInteractiveTransition];
                self.interacting = NO;
            }

        }
            break;
        default:
            break;
    }
    
}

@end
