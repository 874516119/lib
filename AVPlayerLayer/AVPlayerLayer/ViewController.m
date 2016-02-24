//
//  ViewController.m
//  AVPlayerLayer
//
//  Created by zrong_ya on 15/11/26.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSURL *URL = [[NSBundle mainBundle] URLForResource:@"Ship" withExtension:@"mp4"];
    
    AVPlayer *player = [AVPlayer playerWithURL:URL];
    AVPlayerLayer *playerLayer = [AVPlayerLayer playerLayerWithPlayer:player];
    playerLayer.frame = CGRectMake(80, 100, 150, 200);
    playerLayer.videoGravity = AVLayerVideoGravityResize;
    
    
    playerLayer.backgroundColor = [UIColor redColor].CGColor;
    [self.view.layer addSublayer:playerLayer];
    
    [player play];
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
