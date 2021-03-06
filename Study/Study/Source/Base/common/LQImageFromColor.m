//
//  LQImageFromColor.m
//  Study
//
//  Created by 李强 on 16/10/11.
//  Copyright © 2016年 李强. All rights reserved.
//

#import "LQImageFromColor.h"

@implementation LQImageFromColor

+ (UIImage *)getImageFromColor:(UIColor *)color
{
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
