//
//  ViewController.m
//  SpreadTest
//
//  Created by 王兴文 on 2017/5/9.
//  Copyright © 2017年 王兴文. All rights reserved.
//
//屏幕宽度
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "SecondViewController.h"


@interface ViewController ()
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UIView *bgView;
@property (nonatomic,strong)UIImageView *imageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _button =[UIButton buttonWithType:UIButtonTypeCustom];
    _button.center =CGPointMake(kScreenWidth/2, 100);
    _button.bounds=CGRectMake(0, 0, 100, 100);
    _button.layer.cornerRadius=_button.frame.size.height/2;
    _button.layer.masksToBounds=YES;
    _button.backgroundColor=[UIColor purpleColor];
    [_button setTitle:@"打开" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self imageView];
    
    _bgView =[[UIView alloc]initWithFrame:_button.frame];
    _bgView.layer.cornerRadius=_bgView.frame.size.height/2;
    _bgView.layer.masksToBounds=YES;
    _bgView.backgroundColor =[UIColor yellowColor];
    [self.imageView addSubview:_bgView];
    
    
    [self.view addSubview:_button];
    
}
-(void)buttonClick:(UIButton *)sender
{
    [sender setTitle:@"返回" forState:UIControlStateNormal];
    
    SecondViewController *secondVC =[[SecondViewController alloc]init];
    secondVC.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
    secondVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:secondVC animated:YES completion:nil];
    secondVC.returnView=^(NSInteger circleScrollNum){
        [sender setTitle:@"打开" forState:UIControlStateNormal];
        [UIView animateWithDuration:0.4 animations:^{
//            _bgView.frame=_button.frame;
            _bgView.transform = CGAffineTransformMakeScale(1.0, 1.0);
            
//            _bgView.center=_bgView.center;
//            _bgView.bounds=CGRectMake(0, 0, 100, 100);
//            _bgView.layer.cornerRadius=_bgView.frame.size.height/2;
        }];
    };
    
    
    
    
    [UIView animateWithDuration:0.4 animations:^{
        _bgView.transform = CGAffineTransformMakeScale(5.0, 5.0);
//        _bgView.center=_bgView.center;
//        _bgView.bounds=CGRectMake(0, 0, kScreenWidth, kScreenWidth);
//        _bgView.layer.cornerRadius=_bgView.frame.size.height/2;
//        _bgView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    }];
    
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]init];
//        _imageView.frame=CGRectMake(-CGRectGetMinX(_bgView.frame), -CGRectGetMinY(_bgView.frame), kScreenWidth, kScreenHeight);
        _imageView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _imageView.image =[UIImage imageNamed:@"bailu"];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}













@end
