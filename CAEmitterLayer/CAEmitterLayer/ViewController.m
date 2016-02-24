//
//  ViewController.m
//  CAEmitterLayer
//
//  Created by zrong_ya on 15/11/24.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CAEmitterLayer *emitter = [CAEmitterLayer layer];
    emitter.frame = self.view.bounds;
    [self.view.layer addSublayer:emitter];
    emitter.emitterMode = kCAEmitterLayerVolume;
    emitter.emitterShape = kCAEmitterLayerRectangle;
    emitter.renderMode = kCAEmitterLayerBackToFront;
    emitter.emitterPosition = CGPointMake(self.view.bounds.size.width / 2.0, -30);
    emitter.emitterSize		= CGSizeMake(self.view.bounds.size.width * 2.0, 0.0);;
    emitter.shadowOpacity = 1.0;
    emitter.shadowRadius  = 0.0;
    emitter.shadowOffset  = CGSizeMake(0.0, 1.0);
    emitter.shadowColor   = [[UIColor whiteColor] CGColor];
    
    CAEmitterCell *cell = [[CAEmitterCell alloc] init];
    cell.contents = (__bridge id)[UIImage imageNamed:@"heart.png"].CGImage;
    
    cell.birthRate = 5;//cell的数量  按秒算  每秒发射多少
    
    cell.lifetime = 100;  //持续时间
    
    cell.lifetimeRange = 10;
    
    cell.color = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.6f].CGColor;
//    cell.alphaSpeed = 10;  //速度
    cell.velocity = 50;  //速度
    cell.velocityRange = 50;
    cell.emissionRange = M_PI;
    cell.scale = 1.8;//可以放大缩小cell
//    cell.scaleRange = .2;//随机出现 大小最大为x 的cell
//    cell.scaleSpeed = 0.1; // scale+scaleSpeed =最大cell
    
    
//    cell.spin = M_PI_4;
    cell.spinRange		= 0.25 * M_PI;
    
    emitter.emitterCells = @[cell];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
