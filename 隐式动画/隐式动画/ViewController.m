//
//  ViewController.m
//  隐式动画
//
//  Created by zrong_ya on 15/11/30.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "myLayer.h"

@interface ViewController ()


@property (nonatomic,strong) CALayer *layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    myLayer *layer = [myLayer layer];
    layer.backgroundColor = [UIColor yellowColor].CGColor;
    layer.bounds = CGRectMake(0, 0, 100, 100);
    layer.anchorPoint = CGPointZero;
    [self.view.layer addSublayer:layer];
    [layer setNeedsDisplay];
    self.layer = layer;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    //关闭隐式animation
//    [CATransaction begin];
//    [CATransaction setDisableActions:YES];
    
    
    //初始化一个核心动画
    CABasicAnimation *animation = [CABasicAnimation animation];
    //通过key value
    animation.keyPath = @"position";
    //从那
    animation.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 0)];
    //到哪
    animation.toValue = [NSValue valueWithCGPoint:CGPointMake(200, 300)];
    
    //设置动画时间
    animation.duration = 5;
    
    //设置动画执行完毕后不删除动画
    animation.removedOnCompletion = NO;
    
    //保存动画的最新状态
    animation.fillMode = kCAFillModeForwards;
    
    //添加核心动画到layer
    [self.layer addAnimation:animation forKey:nil];
    
    self.layer.backgroundColor = [UIColor greenColor].CGColor;
    
//    self.layer.bounds = CGRectMake(0, 0, 200, 200);
    
    
//    [CATransaction commit];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
