//
//  ViewController.m
//  CATiledLayer
//
//  Created by zrong_ya on 15/11/19.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    CATiledLayer *tiledLayer = [CATiledLayer layer];
    tiledLayer.frame = CGRectMake(40, 100, 300, 300);
    tiledLayer.delegate = self;
    tiledLayer.tileSize = CGSizeMake(30, 30);
    tiledLayer.levelsOfDetail =600;
    [self.view.layer addSublayer:tiledLayer];
    [tiledLayer setNeedsDisplay];
    
}


-(void)drawLayer:(CALayer *)layer inContext:(CGContextRef)ctx
{
    UIImage *image = [UIImage imageNamed:@"1.jpg"];
    UIGraphicsPushContext(ctx);
    [image drawInRect:CGContextGetClipBoundingBox(ctx)];
    UIGraphicsPopContext();
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
