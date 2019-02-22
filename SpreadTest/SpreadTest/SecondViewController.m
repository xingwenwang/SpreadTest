//
//  SecondViewController.m
//  SpreadTest
//
//  Created by 王兴文 on 2017/5/9.
//  Copyright © 2017年 王兴文. All rights reserved.
//
//屏幕宽度
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

#import "SecondViewController.h"

@interface SecondViewController ()
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UILabel *label;
@end

@implementation SecondViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _button.hidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    
    _button =[UIButton buttonWithType:UIButtonTypeCustom];
    _button.center =CGPointMake(kScreenWidth/2, 100);
    _button.bounds=CGRectMake(0, 0, 100, 100);
    _button.backgroundColor=[UIColor purpleColor];
    _button.hidden=YES;
    _button.layer.cornerRadius=_button.frame.size.height/2;
    _button.layer.masksToBounds=YES;
    [_button setTitle:@"返回" forState:UIControlStateNormal];
    [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_button];
    
    
    _label =[[UILabel alloc]initWithFrame:CGRectMake(0, 200, kScreenWidth, 100)];
    _label.text =@"我出现了";
//    _label.textColor=[UIColor whiteColor];
    _label.textAlignment=NSTextAlignmentCenter;
    [self.view addSubview:_label];
    
    
    
    
}

-(void)buttonClick
{
    _button.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
    self.returnView(0);
}
@end
