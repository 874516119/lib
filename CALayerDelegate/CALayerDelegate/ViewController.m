//
//  ViewController.m
//  CALayerDelegate
//
//  Created by zrong_ya on 15/11/6.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    

    
    CALayer * blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(100, 100, 200, 200);
    blueLayer.backgroundColor = [UIColor blueColor].CGColor;
    blueLayer.delegate = self;
    blueLayer.contentsScale = [UIScreen mainScreen].scale;
    [self.view.layer addSublayer:blueLayer];
    [blueLayer display];
    
    

}


/*
 
- (void)displayLayer:(CALayer *)layer;
 
- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx;


- (void)layoutSublayersOfLayer:(CALayer *)layer;


- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event;
 
 */

//- (void)displayLayer:(CALayer *)layer
//{
//    //第二执行
//    NSLog(@"displayLayer");
//}

- (void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    //第二执行  displayLayer 存在不调用
    NSLog(@"drawLayer");
    CGContextSetLineWidth(ctx, 10);
    CGContextSetStrokeColorWithColor(ctx, [UIColor redColor].CGColor);
    CGContextStrokeEllipseInRect(ctx, layer.bounds);
    
}


- (void)layoutSublayersOfLayer:(CALayer *)layer
{
    //第三执行
    NSLog(@"layoutSublayersOfLayer");
}


- (nullable id<CAAction>)actionForLayer:(CALayer *)layer forKey:(NSString *)event
{
    //第一执行
    NSLog(@"actionForLayer");
    return nil;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
