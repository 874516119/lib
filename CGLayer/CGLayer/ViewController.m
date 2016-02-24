//
//  ViewController.m
//  CGLayer
//
//  Created by zrong_ya on 15/11/5.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    CALayer *blueLayer = [CALayer layer];
    blueLayer.frame = CGRectMake(50, 50, 100, 100);
    blueLayer.backgroundColor =[UIColor blueColor].CGColor;
    [self.view.layer addSublayer:blueLayer];
    
}

//重新布局 很好用
-(void)viewWillLayoutSubviews
{
    self.view.frame = CGRectMake(100, 100, 200, 200);

    
}


//controller 上面点击 不会触发响应链
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
