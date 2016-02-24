//
//  ViewController.m
//  CATransition
//
//  Created by zrong_ya on 15/11/27.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)CALayer *mylayer;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 300)];
    [self.view addSubview:view];
    
    _mylayer = [CALayer layer];
    _mylayer.frame = view.bounds;
    
    _mylayer.backgroundColor = [UIColor blueColor].CGColor;
    
    [view.layer addSublayer:_mylayer];
    
    
    CATransition *transition = [CATransition animation];
    transition.type = kCATransitionReveal;
    transition.subtype = kCATransitionFromTop;
    self.mylayer.actions = @{@"backgroundColor":transition};
//    transition.startProgress = .5f;
    [view.layer addSublayer:self.mylayer];
    
   

    
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    
    CGFloat red = arc4random() / (CGFloat)INT_MAX;
    CGFloat green = arc4random() / (CGFloat)INT_MAX;
    CGFloat blue = arc4random() / (CGFloat)INT_MAX;
    self.mylayer.backgroundColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0].CGColor;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
