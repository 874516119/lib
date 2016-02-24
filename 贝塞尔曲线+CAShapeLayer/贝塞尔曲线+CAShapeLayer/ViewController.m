//
//  ViewController.m
//  贝塞尔曲线+CAShapeLayer
//
//  Created by zrong_ya on 15/11/9.
//  Copyright © 2015年 chenxi. All rights reserved.
//

#import "ViewController.h"
#import "KACircleProgressView.h"
#import "Arc_View.h"

@interface ViewController ()
{
    KACircleProgressView *progress;

    Arc_View *arcView;
    float number;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    progress = [[KACircleProgressView alloc] initWithFrame:CGRectMake(0, 0, 100, 100)];
    [self.view addSubview:progress];
    progress.trackColor = [UIColor clearColor];
    progress.progressColor = [UIColor orangeColor];
    progress.progress = .7;
    progress.progressWidth = 10;
    
    
    number = 10;
    
    UIImageView *backgound_imageview= [[UIImageView alloc] initWithFrame:CGRectMake(40, 150, 300, 300)];
    backgound_imageview.image = [UIImage imageNamed:@"map-speed1-bg"];
    backgound_imageview.userInteractionEnabled = YES;
    [self.view addSubview:backgound_imageview];
    
    arcView = [[Arc_View alloc] initWithFrame:CGRectMake(40, 55, 220, 220)];
    arcView.progerss = number/360.f;
    arcView.pointer_view.transform = CGAffineTransformMakeRotation(-M_PI*4/6);
    [backgound_imageview addSubview:arcView];

}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (number < 260) {
        arcView.pointer_view.transform = CGAffineTransformMakeRotation(-M_PI*4/6 + M_PI/180*number);
        number += 10;
        arcView.progerss = (20+number)/360.f;
        NSLog(@"%lf",number);

    }else if (number>=260)
    {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"警告:" message:@"你丫开的太快吓死宝宝了!" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *action = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            
        }];
        [alert addAction:action];
        
        
        [self presentViewController:alert animated:YES completion:^{
            
        }];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
