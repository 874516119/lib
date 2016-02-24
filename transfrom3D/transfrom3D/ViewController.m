//
//  ViewController.m
//  transfrom3D
//
//  Created by zrong_ya on 15/11/9.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property(nonatomic,strong)UIView *innerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIView *outerView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 200, 200)];
    _innerView = [[UIView alloc] initWithFrame:CGRectMake(150, 150, 100, 100)];
    outerView.backgroundColor = [UIColor redColor];
    _innerView.backgroundColor = [UIColor blackColor];
    [self.view addSubview:_innerView];
    [self.view addSubview:outerView];
    
//    CATransform3D outer = CATransform3DMakeRotation(M_PI_4, 0, 0, 1);
//    outerView.layer.transform = outer;
//    CATransform3D inner = CATransform3DMakeRotation(-M_PI_2, 0, 0, 1);
//    _innerView.layer.transform = inner;
    
    
    CATransform3D outer1 = CATransform3DIdentity;
    outer1.m34 = -1.0/500;
    outer1 = CATransform3DRotate(outer1, M_PI_4, 0, 2, 0);
    outerView.layer.transform = outer1;
    
    CATransform3D inner1 = CATransform3DIdentity;
    inner1.m34 = -1.0/500;
    inner1 = CATransform3DRotate(inner1, -M_PI_4, 0, 2, 0);
    outerView.layer.transform = inner1;
    
//    self.view.b
    /*
     CATransform3D CATransform3DIdentity
     
     CATransform3DMakeTranslation(tx,ty,tz);
     CATransform3DMakeScale(sx,sy,sz);
     CATransform3DMakeRotation(angle,x,y,z);
     
     CATransform3D t;
     CATransform3DTranslate(t,tx,ty,tz);
     CATransform3DScale(t,sx,sy,sz);
     CATransform3DRotate(t,angle,x,y,z);
     
     CATransform3DConcat(CATransform3D a, CATransform3D b) //Concat就是combine的意思 用于合成
     CATransform3DInvert  //用于反向
     CATransform3DMakeAffineTransform //2D矩阵转换成3D矩阵
     CATransform3DGetAffineTransform //3D矩阵转换成2D矩阵
     
     */
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
