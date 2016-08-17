//
//  UINavigationPushTransition.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/16.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "GJWNavigationPushAnimate.h"
#import "UINavigationBar+Color.h"
#import "GJWNavigationColorSource.h"

@implementation GJWNavigationPushAnimate

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
    shadowView.alpha = 0;
    
    [containerView addSubview:shadowView];
    [containerView addSubview:toVC.view];
    
    
    
    CGRect originFromFrame = fromVC.view.frame;
    CGRect finalToFrame = [transitionContext finalFrameForViewController:toVC];
    toVC.view.frame = CGRectOffset(finalToFrame, finalToFrame.size.width, 0);
    
    NSTimeInterval duration = [self transitionDuration:transitionContext];
    
    
    [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
        toVC.view.frame = finalToFrame;
        CGRect fromF = CGRectOffset(originFromFrame, -originFromFrame.size.width/2, 0);
        fromVC.view.frame = fromF;
        shadowView.alpha = 0.3;
        
        [fromVC.navigationController.navigationBar gjw_setBackgroundColor:nextColor];
        
        
    } completion:^(BOOL finished) {
        fromVC.view.frame = originFromFrame;
        [shadowView removeFromSuperview];
        [transitionContext completeTransition:![transitionContext transitionWasCancelled]];
//        toVC.view.backgroundColor = [UIColor whiteColor];
    }];

}

@end
