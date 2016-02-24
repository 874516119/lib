//
//  Arc_View.h
//  shape
//
//  Created by 郭晓东 on 15/11/10.
//  Copyright © 2015年 晨曦之晓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Arc_View : UIView
{
    CAShapeLayer *_maskLayer;
}

@property(nonatomic,assign)float progerss;

@property(nonatomic,strong)UIView *pointer_view;

-(instancetype)initWithFrame:(CGRect)frame;


@end
