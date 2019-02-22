//
//  ViewController.m
//  SpreadTwoTest
//
//  Created by 王兴文 on 2017/5/10.
//  Copyright © 2017年 王兴文. All rights reserved.
//
//屏幕宽度
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "SecondViewController.h"
#import "SWAnimationImageView.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UIButton *button;
@property (nonatomic,strong)UIView *bgView;
@property (nonatomic,strong)UIImageView *imageView;

@property (nonatomic,strong)SWAnimationImageView *imageView2;

@property (nonatomic,strong)UITableView *myTableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self imageView];
    [self myTableView];
    [self imageView2];
    [self button];
    
}

-(UIImageView *)imageView
{
    if (!_imageView) {
        _imageView=[[UIImageView alloc]init];
        _imageView.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _imageView.image =[UIImage imageNamed:@"bailu"];
        [self.view addSubview:_imageView];
    }
    return _imageView;
}

-(SWAnimationImageView *)imageView2
{
    if (!_imageView2) {
        _imageView2=[[SWAnimationImageView alloc]init];
        _imageView2.circleRect=CGRectMake((kScreenWidth-60)/2, 100-60/2, 60, 60);
        _imageView2.frame=CGRectMake(0, 0, kScreenWidth, kScreenHeight);
        _imageView2.image =[UIImage imageNamed:@"chunfen"];
        [_myTableView addSubview:_imageView2];
    }
    return _imageView2;
}
-(UIButton *)button
{
    if (!_button) {
        _button =[UIButton buttonWithType:UIButtonTypeCustom];
        _button.center =CGPointMake(kScreenWidth/2, 100);
        _button.bounds=CGRectMake(0, 0, 60, 60);
        _button.layer.cornerRadius=_button.frame.size.height/2;
        _button.layer.masksToBounds=YES;
        _button.backgroundColor=[UIColor purpleColor];
        [_button setTitle:@"打开" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_myTableView addSubview:_button];
    }
    return _button;
}
-(void)buttonClick:(UIButton *)sender
{
    _myTableView.scrollsToTop=YES;
    [sender setTitle:@"返回" forState:UIControlStateNormal];
    SecondViewController *secondVC =[[SecondViewController alloc]init];
    secondVC.view.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.0];
    secondVC.modalPresentationStyle = UIModalPresentationOverFullScreen;
    [self presentViewController:secondVC animated:YES completion:^{
        sender.hidden=YES;
    }];
    
    secondVC.returnView=^(NSInteger circleScrollNum){
        sender.hidden=NO;
        [sender setTitle:@"打开" forState:UIControlStateNormal];
        
        
        [_imageView2 animationWithViewisPresentFromImageView:NO];
    };
    
    CGRect rc = [_imageView2 convertRect:_button.frame toView:self.view];
    [_imageView2 animationWithViewisPresentFromImageView:YES];
}



#pragma mark- 初始界面Table
-(UITableView *)myTableView
{
    if (!_myTableView) {
        _myTableView =[[UITableView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight) style:UITableViewStyleGrouped];
        //        _myTableView.estimatedRowHeight = 400;
        //        _myTableView.rowHeight = UITableViewAutomaticDimension;
        _myTableView.separatorStyle=UITableViewCellSeparatorStyleNone;
        _myTableView.backgroundColor=[UIColor clearColor];
        _myTableView.delegate=self;
        _myTableView.dataSource=self;
        [self.view addSubview:_myTableView];
        [_myTableView registerNib:[UINib nibWithNibName:@"cell" bundle:nil] forCellReuseIdentifier:@"cellIdentifier"];
    }
    return _myTableView;
}
#pragma mark- UITableViewDelegate,UITableViewDataSource
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 44;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 10;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section==0) {
        return 200;
    }
    return 0.0000001;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 10;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell =[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text =[NSString stringWithFormat:@"显示第%ld个cell",indexPath.section];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}












@end
