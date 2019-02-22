//
//  SecondViewController.h
//  SpreadTwoTest
//
//  Created by 王兴文 on 2017/5/10.
//  Copyright © 2017年 王兴文. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnView)(NSInteger circleScrollNum);//返回

@interface SecondViewController : UIViewController

@property (nonatomic,copy)ReturnView returnView;
@end
