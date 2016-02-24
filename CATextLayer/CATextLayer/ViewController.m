//
//  ViewController.m
//  CATextLayer
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
    
    
    UIView *labelView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    labelView.backgroundColor = [UIColor redColor];
    [self.view addSubview:labelView];
    CATextLayer *textLayer = [CATextLayer layer];
    textLayer.frame = labelView.bounds;
    [labelView.layer addSublayer:textLayer];
    
    
    textLayer.alignmentMode = kCAAlignmentJustified;  //对齐模式
    /*
     * 0 modes. *
     
     kCAAlignmentNatural   Natural:自然
     
     kCAAlignmentLeft
     
     kCAAlignmentRight
     
     kCAAlignmentCenter
     
     kCAAlignmentJustified   Justified:合理的   //会拉伸第一行的间距
    
     */
    
    textLayer.contentsScale = [UIScreen mainScreen].scale;
    
    textLayer.wrapped = YES;
    UIFont *font = [UIFont systemFontOfSize:15];
    CFStringRef fontName = (__bridge CFStringRef)font.fontName;
    CGFontRef fontRef = CGFontCreateWithFontName(fontName);
    textLayer.font = fontRef;
    textLayer.fontSize = font.pointSize;
    textLayer.foregroundColor = [UIColor blackColor].CGColor;
    CGFontRelease(fontRef);
    NSString *text = @"你的发型太帅了我靠能不能愉快的玩耍了你的发你的发型太帅了我靠能不能愉快的玩耍了你的发你的发型太帅了我靠能不能愉快的玩耍了你的发你的发型太帅了我靠能不能愉快的玩耍了你的发你的发型太帅了我靠能不能愉快的玩耍了你的发你的发型太帅了我靠能不能愉快的玩耍了你的发你的发型太帅了我靠能不能愉快的玩耍了你的发";
    textLayer.string = text;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
