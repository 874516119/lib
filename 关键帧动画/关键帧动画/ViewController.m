//
//  ViewController.m
//  关键帧动画
//
//  Created by zrong_ya on 15/11/30.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CALayer *layer = [CALayer layer];
    layer.frame = self.view.layer.bounds;
    layer.delegate = self;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [self.view.layer addSublayer:layer];
    [layer display];
    
    [self.view bringSubviewToFront:self.imageView];
    
    CAKeyframeAnimation *keyAnimation = [CAKeyframeAnimation animation];
    keyAnimation.keyPath = @"position";
    
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(250, 50)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(250, 250)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(50, 250)];
    
    keyAnimation.values = @[value1,value2,value3,value4,value1];
    
    keyAnimation.duration = 3;
    
    /*
    kCAMediaTimingFunctionLinear              //线性 就是匀速
    kCAMediaTimingFunctionEaseIn              //先慢后快
    kCAMediaTimingFunctionEaseOut             //西安快后慢
    kCAMediaTimingFunctionEaseInEaseOut       //中间快 两边慢
    kCAMediaTimingFunctionDefault  //默认的
    */
    
    //调整动画节奏
//    keyAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    
    
    CGMutablePathRef path = CGPathCreateMutable();
    
    
    CGPathAddEllipseInRect(path, nil, CGRectMake(0, 0, 300, 300));
    
    keyAnimation.path = path;
    
    
    
    [self.imageView.layer addAnimation:keyAnimation forKey:nil];
    
    
    CFRelease(path);
    
}


-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    
    CGContextAddEllipseInRect(ctx,CGRectMake(0, 0, 300, 300));
    CGContextSetRGBStrokeColor(ctx, 1, 0, 0, 1);
    CGContextSetLineWidth(ctx, 3);
    
    CGContextStrokePath(ctx);
   
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
