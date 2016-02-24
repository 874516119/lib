//
//  ViewController.m
//  CAGradientLayer
//
//  Created by zrong_ya on 15/11/11.
//  Copyright © 2015年 chenxi. All rights reserved.
//


#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    //渐变色
    CAGradientLayer *gradient = [CAGradientLayer layer];
    gradient.colors = @[(__bridge id)[UIColor redColor].CGColor,(__bridge id)[UIColor cyanColor].CGColor,(__bridge id)[UIColor purpleColor].CGColor,(__bridge id)[UIColor brownColor].CGColor,(__bridge id)[UIColor lightGrayColor].CGColor];
    gradient.locations = @[@.0,@.25,@.5,@.75,@1];
    gradient.startPoint = CGPointMake(0, 0);
    gradient.endPoint = CGPointMake(0, 1);
    gradient.frame = self.view.bounds;
    [self.view.layer addSublayer:gradient];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
