//
//  Arc_View.m
//  shape
//
//  Created by 郭晓东 on 15/11/10.
//  Copyright © 2015年 晨曦之晓. All rights reserved.
//

#import "Arc_View.h"

@implementation Arc_View
{
    int i;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImage *backgroud_image = [UIImage imageNamed:@"map-speed1-02"];
        self.layer.contents = (__bridge id)backgroud_image.CGImage;
        self.layer.contentsGravity = kCAGravityResize;
        self.layer.contentsScale = [UIScreen mainScreen].scale;
                
        _maskLayer = [[CAShapeLayer alloc] init];
        _maskLayer.fillColor = [UIColor clearColor].CGColor;
        _maskLayer.strokeColor = [UIColor whiteColor].CGColor;
        _maskLayer.lineWidth = CGRectGetWidth(frame)/2;
        _maskLayer.contentsGravity = kCAGravityResize;
        [self setProgerss:1];
        
        
        UIView *subView = [[UIView alloc] init];
        UIImage *image = [UIImage imageNamed:@"map-speed1-02a"];
        subView.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        subView.layer.contents = (__bridge id)image.CGImage;
        subView.layer.contentsGravity = kCAGravityResize;
        subView.layer.contentsScale = [UIScreen mainScreen].scale;
        subView.layer.mask = _maskLayer;
        subView.backgroundColor = [UIColor clearColor];
        [self addSubview:subView];
        
        self.pointer_view = [[UIView alloc] init];
        UIImage *image_pointer = [UIImage imageNamed:@"map-speed1-01"];
        self.pointer_view.frame = CGRectMake(0, 0, CGRectGetWidth(frame), CGRectGetHeight(frame));
        self.pointer_view.layer.contents = (__bridge id)image_pointer.CGImage;
        self.pointer_view.layer.contentsGravity = kCAGravityResize;
        self.pointer_view.layer.contentsScale = [UIScreen mainScreen].scale;
        [self addSubview:self.pointer_view];
        
    }
    return self;
}

-(void)setTrack:(float)coefficient
{
    if (coefficient) {
        UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(CGRectGetWidth(self.frame)/2, CGRectGetHeight(self.frame)/2) radius:(self.bounds.size.width/2-18) startAngle:-M_PI*4/3 endAngle:M_PI*2*coefficient-M_PI*4/3 clockwise:YES];
        _maskLayer.path = path.CGPath;
    }
    
}

-(void)setProgerss:(float)progerss
{
    [self setTrack:progerss];
}



@end
