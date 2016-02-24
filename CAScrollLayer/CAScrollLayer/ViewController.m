//
//  ViewController.m
//  CAScrollLayer
//
//  Created by zrong_ya on 15/11/18.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    

    CAScrollLayer *scrollLayer = [CAScrollLayer layer];
    
    scrollLayer.frame = CGRectMake(100, 100, 200, 200);
//    scrollLayer.visibleRect = CGRectMake(200, 200, 400, 400);
    scrollLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:scrollLayer];
    
    CALayer *imageLayer = [CALayer layer];
    imageLayer.frame = scrollLayer.bounds;
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    imageLayer.contents = (__bridge id)image.CGImage;
    imageLayer.contentsScale = [UIScreen mainScreen].scale;
    imageLayer.contentsGravity = kCAGravityResize;
    
    [scrollLayer addSublayer:imageLayer];
    

    [scrollLayer scrollToRect:CGRectMake(0, 0, 200, 1000)];
    
    
    [scrollLayer scrollRectToVisible:CGRectMake(30, 30, 300, 200)];
    
    //垃圾玩意


    
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
