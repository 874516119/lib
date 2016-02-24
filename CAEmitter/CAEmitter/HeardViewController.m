//
//  HeardViewController.m
//  CAEmitter扩展
//
//  Created by zrong_ya on 15/11/25.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "HeardViewController.h"

#define MyBounds [UIScreen mainScreen].bounds.size


@interface HeardViewController ()

@property (strong)CAEmitterLayer *heartsEmitter;


@end

@implementation HeardViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"2.png"].CGImage;
    self.view.layer.contentsGravity = kCAGravityResize;
    
    self.heartsEmitter = [CAEmitterLayer layer];
    self.heartsEmitter.emitterPosition = CGPointMake(MyBounds.width/2, MyBounds.height/2);
    self.heartsEmitter.emitterSize = MyBounds;
    self.heartsEmitter.emitterMode = kCAEmitterLayerVolume;
    self.heartsEmitter.emitterShape = kCAEmitterLayerRectangle;
    self.heartsEmitter.renderMode = kCAEmitterLayerAdditive;
    
    
    CAEmitterCell *heartCell = [CAEmitterCell emitterCell];
    heartCell.name = @"heart";
    
    heartCell.emissionLongitude = M_PI_2;
    heartCell.emissionRange = 0.55*M_PI;
    heartCell.birthRate = 0.0;
    heartCell.lifetime = 10.0;
    
    heartCell.velocity = -120;
    heartCell.velocityRange = 60;
    heartCell.yAcceleration = 20;
    
    heartCell.contents = (__bridge id)[UIImage imageNamed:@"heart.png"].CGImage;
    heartCell.color = [UIColor colorWithRed:0.5 green:0.0 blue:0.5 alpha:0.5].CGColor;
    heartCell.redRange = 0.3;
    heartCell.blueRange = 0.3;
    heartCell.alphaSpeed = -0.5/heartCell.lifetime;
    
    heartCell.scale = 0.15;
    heartCell.scaleSpeed = 0.5;
    heartCell.spinRange = 2.0*M_PI;
    
    self.heartsEmitter.emitterCells = @[heartCell];
    
    [self.view.layer addSublayer:self.heartsEmitter];
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    CABasicAnimation *heartsAnimation = [CABasicAnimation animationWithKeyPath:@"emitterCells.heart.birthRate"];
    
    heartsAnimation.fromValue = [NSNumber numberWithFloat:120.0];
    heartsAnimation.toValue = [NSNumber numberWithFloat:0.0];
    heartsAnimation.duration = 1.0;
    heartsAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    [self.heartsEmitter addAnimation:heartsAnimation forKey:@"heartsAnimation"];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
