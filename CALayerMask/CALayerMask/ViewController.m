//
//  ViewController.m
//  CALayerMask
//
//  Created by zrong_ya on 15/11/9.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    CALayer *maskLayer;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 100, CGRectGetWidth(self.view.frame)-100, CGRectGetHeight(self.view.frame)-200)];
    [self.view addSubview:view];
    view.layer.backgroundColor = [UIColor redColor].CGColor;
    view.layer.contents = (__bridge id)[UIImage imageNamed:@"9.jpg"].CGImage;
    view.layer.contentsGravity = kCAGravityResize;
    
    
    maskLayer = [CALayer layer];
    maskLayer.frame = CGRectMake(100, 100, 100, 100);
    maskLayer.backgroundColor = [UIColor blueColor].CGColor;
    maskLayer.cornerRadius = 50;
    view.layer.mask = maskLayer;
    

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    //触发的只是隐式动画
    [UIView animateWithDuration:10 animations:^{
        maskLayer.frame = CGRectMake(-50, -50, 400, 500);
    }];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
