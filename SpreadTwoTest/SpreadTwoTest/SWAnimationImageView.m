//
//  SWAnimationImageView.m
//  SpreadTwoTest
//
//  Created by 王兴文 on 2017/5/10.
//  Copyright © 2017年 王兴文. All rights reserved.
//
//屏幕宽度
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

#import "SWAnimationImageView.h"
@interface SWAnimationImageView ()<CAAnimationDelegate>
@property (nonatomic,strong)CAShapeLayer *shapLayer;

@end
@implementation SWAnimationImageView

-(instancetype)initWithFrame:(CGRect)frame
{
    self =[super initWithFrame:frame];
    if (self) {
        [self shapLayer];
    }
    return self;
}
-(CAShapeLayer *)shapLayer
{
    //1.创建layer
    if (!_shapLayer) {
        _shapLayer= [[CAShapeLayer alloc]init];
    }
    return _shapLayer;
}
-(void)setCircleRect:(CGRect)circleRect
{
    _circleRect=circleRect;
    [self startDescribingCircle];
}
//起始路径 -圆
-(UIBezierPath*)startDescribingCircle
{
    
    
//    CGPoint point = [self convertPoint:self.superview.center toView:self];
//    CGRect rc = [self convertRect:_circleRect toView:self.superview];
    
    
    CGPoint circleCenter =CGPointMake(CGRectGetMidX(_circleRect), CGRectGetMidY(_circleRect));
    CGFloat radius = CGRectGetWidth(_circleRect)/2;
    
    UIBezierPath* startPath = [UIBezierPath bezierPathWithArcCenter:circleCenter
                                                         radius:radius
                                                     startAngle:0
                                                       endAngle:2*M_PI
                                                        clockwise:YES];
//    3.设置贝塞尔属性                           
//    填充颜色
//    self.shapLayer.fillColor = [UIColor redColor].CGColor;
//    4.将贝塞尔作为layer的路径
    self.shapLayer.path = startPath.CGPath;
//    将layer作为父视图的遮罩图层.
    self.layer.mask = self.shapLayer;
//    5.将path添加到视图中
    return startPath;
}
//动画自定义封装
-(void)animationWithViewisPresentFromImageView:(BOOL)isPresent{
    
    //2.创建贝塞尔路径(参数为圆的外接矩形)
    //屏幕对角线
    CGFloat endRadius =sqrt(kScreenHeight*kScreenHeight +kScreenWidth*kScreenWidth);
    
    //起始路径 -圆
    UIBezierPath* startPath = [self startDescribingCircle];
    //终止路径-全屏
    UIBezierPath *endPath = [UIBezierPath bezierPathWithOvalInRect:CGRectInset(startPath.bounds, -endRadius, -endRadius) ];
    
    //使用核心动画实现
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"path"];
    
    if (isPresent) {
        animation.fromValue = (__bridge id _Nullable)(startPath.CGPath);
        animation.toValue = (__bridge id _Nullable)(endPath.CGPath);
    }else{
        animation.fromValue = (__bridge id _Nullable)(endPath.CGPath);
        animation.toValue = (__bridge id _Nullable)(startPath.CGPath);
    }
    animation.delegate = self;
    
    //设置动画属性
    animation.fillMode = kCAFillModeForwards;
    
    animation.duration = 0.4;
    
    animation.removedOnCompletion = NO;
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    //添加动画到图层
    [self.shapLayer addAnimation:animation forKey:@"path"];
}
#pragma mark - CAAnimationDelegate
//动画开始
- (void)animationDidStart:(CAAnimation *)anim{
    
}

@end
