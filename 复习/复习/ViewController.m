//
//  ViewController.m
//  复习
//
//  Created by zrong_ya on 15/12/2.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.layer.delegate = self;
    
//    [self.view.layer setNeedsDisplay];
    
}


-(void)viewWillAppear:(BOOL)animated
{
   
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
