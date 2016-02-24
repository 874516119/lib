//
//  ViewController.m
//  Transactions
//
//  Created by zrong_ya on 15/11/26.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic,strong)CALayer *image_layer;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor yellowColor];
    
    _image_layer = [CALayer layer];
    _image_layer.contents = (__bridge id)[UIImage imageNamed:@"1.jpg"].CGImage;
    _image_layer.frame = CGRectMake(150, 100, 100, 100);
    [self.view.layer addSublayer:self.image_layer];
   
    
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [CATransaction begin];
    [CATransaction setAnimationDuration:5];
    [CATransaction setCompletionBlock:^{
        self.view.backgroundColor = [UIColor redColor];
    }];
    _image_layer.contents = (__bridge id)[UIImage imageNamed:@"2.jpg"].CGImage;
    _image_layer.frame = CGRectMake(100, 100, 200, 200);
    [CATransaction commit];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
