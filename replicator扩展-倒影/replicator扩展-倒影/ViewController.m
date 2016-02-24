//
//  ViewController.m
//  replicator扩展-倒影
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
    
    UIView *image_view = [[UIView alloc] initWithFrame:CGRectMake(0 , 0, 200, 200)];
//    [self.view addSubview:image_view];
    
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    image_view.layer.contents = (__bridge id)image.CGImage;
    image_view.layer.contentsScale = [UIScreen mainScreen].scale;
    image_view.layer.contentsGravity = kCAGravityResize;
    
    CAReplicatorLayer *layer = [CAReplicatorLayer layer];
    layer.instanceCount = 2;
    CATransform3D transform = CATransform3DIdentity;
    CGFloat verticalOffset = image_view.bounds.size.height +1;
    transform = CATransform3DTranslate(transform, 0, verticalOffset, 0);
    transform = CATransform3DScale(transform, 1, -1, 0);
    
    layer.instanceTransform = transform;
    layer.instanceAlphaOffset = -0.6f;
    
    layer.frame = CGRectMake(100, 100, 200, 200);
    [self.view.layer addSublayer:layer];
    [layer addSublayer:image_view.layer];
    
    

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
