//
//  myLayer.m
//  隐式动画
//
//  Created by zrong_ya on 15/11/30.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "myLayer.h"

@implementation myLayer

-(void)drawInContext:(CGContextRef)ctx
{
    CGContextAddEllipseInRect(ctx, CGRectMake(1, 1, 98, 98));
    CGContextSetRGBFillColor(ctx, 1, 0, 0, 1);
    
    CGContextFillPath(ctx);
    NSLog(@"%@",ctx);
}

@end
