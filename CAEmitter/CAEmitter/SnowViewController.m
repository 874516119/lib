//
//  ViewController.m
//  CAEmitter
//
//  Created by zrong_ya on 15/11/25.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "SnowViewController.h"

@interface SnowViewController ()

@end

@implementation SnowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"5.jpg"].CGImage;
    self.view.layer.contentsGravity = kCAGravityResize;
    self.view.layer.contentsScale = [UIScreen mainScreen].scale;
    
    CAEmitterLayer *snowEmitter = [CAEmitterLayer layer];
    snowEmitter.emitterPosition = CGPointMake(self.view.bounds.size.width/2, -30);
    snowEmitter.emitterSize = CGSizeMake(self.view.bounds.size.width*2.0, 0.0);
    
    snowEmitter.emitterMode = kCAEmitterLayerOutline;
    snowEmitter.emitterShape = kCAEmitterLayerLine;
    
    //设置shadow
    snowEmitter.shadowOpacity = 1.0;
    snowEmitter.shadowRadius = 0.0;
    snowEmitter.shadowOffset = CGSizeMake(0.0, 1.0);
    snowEmitter.shadowColor = [[UIColor whiteColor] CGColor];
    
    CAEmitterCell *snowflake = [CAEmitterCell emitterCell];
    snowflake.birthRate = 3;
    snowflake.lifetime = 60;
    
    snowflake.velocity = -10;//速度
    snowflake.velocity = 5;
//    NSLog(@"%f",snowflake.velocity);
    
    snowflake.yAcceleration = 2;
    snowflake.emissionRange = .5f * M_PI;
    snowflake.spinRange = .25*M_PI;
    
    snowflake.contents = (__bridge id)[UIImage imageNamed:@"snowflake.png"].CGImage;
    snowflake.color = [UIColor colorWithRed:.60f green:.658 blue:.743 alpha:1.00].CGColor;
    
    snowEmitter.emitterCells = @[snowflake];
    [self.view.layer insertSublayer:snowEmitter above:0];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
