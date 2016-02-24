//
//  ViewController.m
//  组动画
//
//  Created by zrong_ya on 15/12/1.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    CALayer *_layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CALayer *layer = [CALayer layer];
    layer.backgroundColor = [UIColor redColor].CGColor;
    layer.frame = CGRectMake(100, 100, 10, 10);
    [self.view.layer addSublayer:layer];
    
    _layer = layer;
    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CABasicAnimation *animation1 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    animation1.fromValue = (__bridge id)[UIColor blueColor].CGColor;
    animation1.toValue = (__bridge id)[UIColor yellowColor].CGColor;
    
    
    CAKeyframeAnimation *animation2 = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    NSValue *value1 = [NSValue valueWithCGPoint:CGPointMake(50, 50)];
    NSValue *value2 = [NSValue valueWithCGPoint:CGPointMake(50, 300)];
    NSValue *value3 = [NSValue valueWithCGPoint:CGPointMake(250, 300)];
    NSValue *value4 = [NSValue valueWithCGPoint:CGPointMake(250, 50)];
    
    animation2.values = @[value1,value2,value3,value4,value1];
    
    CAAnimationGroup *groupAnimention = [CAAnimationGroup animation];
    groupAnimention.animations = @[animation1,animation2];
    groupAnimention.duration = 5;
    [_layer addAnimation:groupAnimention forKey:nil];

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
