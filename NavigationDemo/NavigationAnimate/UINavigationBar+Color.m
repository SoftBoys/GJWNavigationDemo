//
//  UINavigationBar+BackgroundColor.m
//  NavigationDemo
//
//  Created by dfhb@rdd on 16/8/15.
//  Copyright © 2016年 guojunwei. All rights reserved.
//

#import "UINavigationBar+Color.h"
#import <objc/runtime.h>

@interface UINavigationBar ()

@property (nonatomic, strong) UIView *backView;

@end

static char backViewKey;
@implementation UINavigationBar (Color)
static char overlayKey;
- (UIView *)overlay
{
    return objc_getAssociatedObject(self, &overlayKey);
}

- (void)setOverlay:(UIView *)overlay
{
    objc_setAssociatedObject(self, &overlayKey, overlay, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (void)lt_setBackgroundColor:(UIColor *)backgroundColor
{
    if (!self.overlay) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        
        // insert an overlay into the view hierarchy
        self.overlay = [[UIView alloc] initWithFrame:CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, self.bounds.size.height + 20)];
        self.overlay.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        
        [self insertSubview:self.overlay atIndex:0];
    }
    self.overlay.backgroundColor = backgroundColor;
}

- (void)setBackView:(UIView *)backView {
    objc_setAssociatedObject(self, &backViewKey, backView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}
- (UIView *)backView {
    return objc_getAssociatedObject(self, &backViewKey);
}

- (void)gjw_setBackgroundColor:(UIColor *)backgroundColor {
    
    if (self.backView == nil) {
        [self setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
        self.shadowImage = [UIImage new];
        UIView *view = [UIView new];
        view.frame = CGRectMake(0, -20, [UIScreen mainScreen].bounds.size.width, 64);
        [self insertSubview:view atIndex:0];
        self.backView = view;
        view.autoresizingMask = UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight;
        view.userInteractionEnabled = NO;
    }
//    self.translucent = NO;
    self.backView.backgroundColor = backgroundColor;
}

- (void)gjw_reset {
    [self setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    self.shadowImage = nil;
    [self.backView removeFromSuperview];
    self.backView = nil;
}

@end
