//
//  ViewController.m
//  CALayout实现折叠动画
//
//  Created by zrong_ya on 15/11/5.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

{
    /*
     CAGradientLayer:用来绘制渐变色,指定几个颜色值、渐变结束位置,就能在layer中绘制出渐变效果
     */
    CAGradientLayer *_shadomLayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    
    UIView *myview1 = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 200)];
    myview1.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myview1];
    
    
    UIImage *image = [UIImage imageNamed:@"xueai.jpg"];
    /*
     在arc 下oc指针转化C指针要用bridge 关键字转化
     __bridge关键字，不对对象的引用计数器进行任何处理。
     __bridge_retained关键字则会让对象的引用计数器+1。一旦__bridge_retained转换完成，ARC就不用在负责释放该对象了。
     __bridge_transfer关键字则会让对象的引用计数器+1。一旦__bridge_retained转换完成，ARC还负责释放该对象了。
     */
    myview1.layer.contents = (__bridge id)image.CGImage;
    
    /*
     kCAGravityCenter             内容集中在水平和垂直方向的边界矩形。
     kCAGravityTop                内容是横向集中在边界矩形的上边缘。
     kCAGravityBottom             水平为中心内容的底部边缘边界矩形。
     kCAGravityLeft               内容是垂直集中在边界矩形的左边缘。
     kCAGravityRight              内容是垂直集中右边缘的边界矩形。
     kCAGravityTopLeft            内容定位在边界矩形的左上侧。
     kCAGravityTopRight           内容定位在边界矩形的右上侧。
     kCAGravityBottomLeft         内容定位在边界矩形的左下侧。
     kCAGravityBottomRight        内容定位在边界矩形的右下侧
     kCAGravityResize             内容的大小,以适应整个边界矩形。//拉伸
     kCAGravityResizeAspect       内容的大小,以适应边界矩形,保护方面的内容。如果内容不完全填补边界矩形,内容集中在偏轴。//不会拉伸
     kCAGravityResizeAspectFill   内容完全填补边界矩形的大小,同时仍然保留方面的内容。内容集中在轴超过。//imageView 就用的这个玩意
    */
    myview1.layer.contentsGravity = kCAGravityResize;
    
    //调整点的规模
    myview1.layer.contentsScale = [UIScreen mainScreen].scale;
    myview1.layer.contentsRect = CGRectMake(0, 0, 0.5, 1);//默认大小
    myview1.layer.anchorPoint = CGPointMake(1, 0);//设置抛点 因为设置了抛点 所以重新定义frame 或设置 原点
    myview1.layer.position = CGPointMake(200,100);
    //创建渐变图层
    _shadomLayer = [CAGradientLayer layer];
    _shadomLayer.colors = @[(id)[UIColor clearColor],(id)[[UIColor blackColor] CGColor]];
    _shadomLayer.frame = myview1.bounds;
    _shadomLayer.opacity = 0;
    [myview1.layer addSublayer:_shadomLayer];
    
    UIPanGestureRecognizer *panGest = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panClick:)];
    [myview1 addGestureRecognizer:panGest];
    
    
    
    UIView *myview2 = [[UIView alloc] initWithFrame:CGRectMake(200, 100, 100, 200)];
    myview2.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:myview2];
    
    myview2.layer.contents = (__bridge id)image.CGImage;
    myview2.layer.contentsGravity = kCAGravityResize;
    myview2.layer.contentsScale = [UIScreen mainScreen].scale;
    myview2.layer.contentsRect = CGRectMake(0.5, 0, 0.5, 1);
    
    [self.view bringSubviewToFront:myview1];
    
}


-(void)panClick:(nullable UIGestureRecognizer *)resture
{
    UIView *myview = resture.view;
    UIPanGestureRecognizer *panGest = (UIPanGestureRecognizer *)resture;
    CGPoint transP = [panGest translationInView:self.view];
    if (transP.x <= 200) {
        CATransform3D transform3D = CATransform3DIdentity;
        transform3D.m34 = -1/1000.0;
        CGFloat angle = transP.x/200.0 *M_PI;
        myview.layer.transform = CATransform3DRotate(transform3D, angle, 0, 1, 0);
        myview.layer.contentsRect = CGRectMake(0, 0, 0.5, 1);
        _shadomLayer.opacity = transP.x*1 /200.0;
        UIImage *image = [UIImage imageNamed:@"xueai.jpg"];
        myview.layer.contents = (__bridge id)image.CGImage;
        
        if (transP.x >= 100) {
            UIImage *image1 = [UIImage imageNamed:@"zuozhu.jpg"];
            myview.layer.contents = (__bridge id)image1.CGImage;
            myview.layer.contentsRect = CGRectMake(0, 0, 1, 1);
        }
        
    }
    if (panGest.state == UIGestureRecognizerStateEnded) {
        //还原
        [UIView animateWithDuration:0.5 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:3 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            myview.layer.transform = CATransform3DIdentity;
            _shadomLayer.opacity = 0;
            myview.layer.contentsRect = CGRectMake(0, 0, 0.5, 1);
            UIImage *image = [UIImage imageNamed:@"xueai.jpg"];
            myview.layer.contents = (__bridge id)image.CGImage;
        } completion:nil];
    }
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
