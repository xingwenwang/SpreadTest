//
//  SecondViewController.m
//  SpreadTwoTest
//
//  Created by 王兴文 on 2017/5/10.
//  Copyright © 2017年 王兴文. All rights reserved.
//

#import "SecondViewController.h"
//屏幕宽度
#define kScreenWidth        [[UIScreen mainScreen] bounds].size.width
//屏幕高度
#define kScreenHeight       [[UIScreen mainScreen] bounds].size.height

@interface SecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong)UITableView *myTableView;

@property (nonatomic,strong)UIButton *button;
@end

@implementation SecondViewController
-(void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    _button.hidden=NO;
}
- (void)viewDidLoad {
    [super viewDidLoad];

    [self myTableView];
    [self button];
}

-(UIButton *)button
{
    if (!_button) {
        _button =[UIButton buttonWithType:UIButtonTypeCustom];
        _button.center =CGPointMake(kScreenWidth/2, 100);
        _button.bounds=CGRectMake(0, 0, 60, 60);
        _button.layer.cornerRadius=_button.frame.size.height/2;
        _button.layer.masksToBounds=YES;
        _button.hidden=YES;
        _button.backgroundColor=[UIColor purpleColor];
        [_button setTitle:@"返回" forState:UIControlStateNormal];
        [_button addTarget:self action:@selector(buttonClick) forControlEvents:UIControlEventTouchUpInside];
        [_myTableView addSubview:_button];
    }
    return _button;
}

-(void)buttonClick
{
    _button.hidden=YES;
    [self dismissViewControllerAnimated:YES completion:nil];
    self.returnView(0);
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
    cell.textLabel.text =[NSString stringWithFormat:@"第二层显示第%ld个cell",indexPath.section];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
