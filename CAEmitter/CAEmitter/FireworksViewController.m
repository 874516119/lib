//
//  FireworksViewController.m
//  CAEmitter扩展
//
//  Created by zrong_ya on 15/11/25.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "FireworksViewController.h"

@interface FireworksViewController ()

@end

@implementation FireworksViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.layer.contents = (__bridge id)[UIImage imageNamed:@"3.jpg"].CGImage;
    self.view.layer.contentsGravity = kCAGravityResize;
    
    CAEmitterLayer *fireworksEmitter = [CAEmitterLayer layer];
    CGRect viewBounds = self.view.layer.bounds;
    fireworksEmitter.emitterPosition = CGPointMake(viewBounds.size.width/2.0, viewBounds.size.height-150);
    fireworksEmitter.emitterSize	= CGSizeMake(viewBounds.size.width/2.0, 0.0);
    fireworksEmitter.emitterMode	= kCAEmitterLayerOutline;
    fireworksEmitter.emitterShape	= kCAEmitterLayerLine;
    fireworksEmitter.renderMode		= kCAEmitterLayerAdditive;
    fireworksEmitter.seed = (arc4random()%100)+1;
    
    // Create the rocket
    CAEmitterCell* rocket = [CAEmitterCell emitterCell];
    
    rocket.birthRate		= 1.0;
    rocket.emissionRange	= 0.25 * M_PI;  // some variation in angle
    rocket.velocity			= 380;
    rocket.velocityRange	= 100;
    rocket.yAcceleration	= 75;
    rocket.lifetime			= 1.02;	// we cannot set the birthrate < 1.0 for the burst
    
    rocket.contents			= (id) [[UIImage imageNamed:@"ring"] CGImage];
    rocket.scale			= 0.2;
    rocket.color			= [[UIColor redColor] CGColor];
    rocket.greenRange		= 1.0;		// different colors
    rocket.redRange			= 1.0;
    rocket.blueRange		= 1.0;
    rocket.spinRange		= M_PI;		// slow spin
    
    
    
    // the burst object cannot be seen, but will spawn the sparks
    // we change the color here, since the sparks inherit its value
    CAEmitterCell* burst = [CAEmitterCell emitterCell];
    
    burst.birthRate			= 1.0;		// at the end of travel
    burst.velocity			= 0;
    burst.scale				= 2.5;
    burst.redSpeed			=-1.5;		// shifting
    burst.blueSpeed			=+1.5;		// shifting
    burst.greenSpeed		=+1.0;		// shifting
    burst.lifetime			= 0.35;
    
    // and finally, the sparks
    CAEmitterCell* spark = [CAEmitterCell emitterCell];
    
    spark.birthRate			= 400;
    spark.velocity			= 125;
    spark.emissionRange		= 2* M_PI;	// 360 deg
    spark.yAcceleration		= 75;		// gravity
    spark.lifetime			= 3;
    
    spark.contents			= (id) [[UIImage imageNamed:@"starOutline"] CGImage];
    spark.scaleSpeed		=-0.2;
    spark.greenSpeed		=-0.1;
    spark.redSpeed			= 0.4;
    spark.blueSpeed			=-0.1;
    spark.alphaSpeed		=-0.25;
    spark.spin				= 2* M_PI;
    spark.spinRange			= 2* M_PI;
    
    // putting it together
    fireworksEmitter.emitterCells	= [NSArray arrayWithObject:rocket];
    rocket.emitterCells				= [NSArray arrayWithObject:burst];
    burst.emitterCells				= [NSArray arrayWithObject:spark];
    [self.view.layer addSublayer:fireworksEmitter];
    
    
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
