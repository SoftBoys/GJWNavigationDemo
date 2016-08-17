//
//  UINavigationPopTransition.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/16.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "GJWNavigationPopAnimate.h"
#import "UINavigationBar+Color.h"
#import "GJWNavigationColorSource.h"


@implementation GJWNavigationPopAnimate
- (NSTimeInterval)transitionDuration:(nullable id <UIViewControllerContextTransitioning>)transitionContext {
    return 0.3;
}

- (void)animateTransition:(id <UIViewControllerContextTransitioning>)transitionContext {
    
    UIViewController<GJWNavigationColorSource> *fromVC = [transitionContext viewControllerForKey:UITransitionContextFromViewControllerKey];
    
    UIViewController<GJWNavigationColorSource> *toVC = [transitionContext viewControllerForKey:UITransitionContextToViewControllerKey];
    
    UIColor *nextColor = nil;
    if ([fromVC conformsToProtocol:@protocol(GJWNavigationColorSource)]) {
        id <GJWNavigationColorSource> dataSource = fromVC;
        if ([dataSource respondsToSelector:@selector(navigationBarOutColor)]) {
            if ([dataSource navigationBarInColor]) {
                nextColor = [dataSource navigationBarInColor];
            }
        }
    }
    if ([toVC conformsToProtocol:@protocol(GJWNavigationColorSource)]) {
        id<GJWNavigationColorSource> dataSource = toVC;
        if ([dataSource respondsToSelector:@selector(navigationBarOutColor)]) {
            if ([dataSource navigationBarInColor]) {
                nextColor = [dataSource navigationBarInColor];
            }
        }
    }
    
    UIView *containerView = [transitionContext containerView];
    UIView *shadowView = [[UIView alloc] init];
    shadowView.frame = containerView.bounds;
    shadowView.backgroundColor = [UIColor blackColor];
    shadowView.alpha = 0.3;
    
    
    CGRect finalF = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalF, -finalF.size.width/2, 0);
    
    [containerView insertSubview:toVC.view belowSubview:fromVC.view];
    [containerView insertSubview:shadowView aboveSubview:toVC.view];

    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    self.animating = YES;
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveLinear animations:^{
        toVC.view.frame = finalF;
        fromVC.view.frame = CGRectOffset(fromVC.view.frame, fromVC.view.frame.size.width, 0);
        shadowView.alpha = 0;
        
        [fromVC.navigationController.navigationBar gjw_setBackgroundColor:nextColor];
        
    } completion:^(BOOL finished) {
//        fromVC.view.frame = fromF;
        self.animating = NO;
        [shadowView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        toVC.view.backgroundColor = [UIColor whiteColor];
    }];
    
}

@end
