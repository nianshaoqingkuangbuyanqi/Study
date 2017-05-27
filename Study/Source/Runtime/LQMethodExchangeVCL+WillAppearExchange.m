//
//  LQMethodExchangeVCL+WillAppearExchange.m
//  Study
//
//  Created by mayibailing1 on 2017/5/27.
//  Copyright © 2017年 李强. All rights reserved.
//

#import "LQMethodExchangeVCL+WillAppearExchange.h"
#import <objc/runtime.h>

@implementation LQMethodExchangeVCL (WillAppearExchange)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        SEL oldSEL = @selector(viewWillAppear:);
        SEL newSEL = @selector(exchangeViewWillAppear:);
        Method oldMethod = class_getInstanceMethod([self class], oldSEL);
        Method newMethod = class_getInstanceMethod([self class], newSEL);
        BOOL methodDidAdd = class_addMethod([self class], oldSEL, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
        if (methodDidAdd) {
            class_replaceMethod([self class], newSEL, method_getImplementation(oldMethod), method_getTypeEncoding(oldMethod));
        } else {
            method_exchangeImplementations(oldMethod, newMethod);
        }
    });
}

- (void)exchangeViewWillAppear:(BOOL)animated
{
    [self exchangeViewWillAppear:animated];
    self.title = @"456";
}

@end
