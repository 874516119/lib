//
//  ViewController.m
//  CAReplicatorLayer
//
//  Created by zrong_ya on 15/11/16.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor redColor];
    
    UIView *content_view = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 50, 50)];
    content_view.backgroundColor = [UIColor clearColor];
    [self.view addSubview:content_view];
    CAReplicatorLayer *replicator = [CAReplicatorLayer layer];
    replicator.frame = content_view.bounds;
    [content_view.layer addSublayer:replicator];
    
    replicator.instanceCount = 10;
    CGFloat angle = 2*M_PI/10;
    replicator.instanceTransform = CATransform3DMakeRotation(angle, 0, 0, 1);
    replicator.instanceGreenOffset = -.1;
    
    //sqrt 根号
    CALayer *layer = [CALayer layer];
    layer.frame = CGRectMake(sqrt(pow(100, 2)+pow(100, 2)),0, 50, 50);
    layer.cornerRadius = 25;
    layer.backgroundColor = [UIColor whiteColor].CGColor;
    [replicator addSublayer:layer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
