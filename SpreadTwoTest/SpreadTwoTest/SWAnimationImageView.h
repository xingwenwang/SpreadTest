//
//  SWAnimationImageView.h
//  SpreadTwoTest
//
//  Created by 王兴文 on 2017/5/10.
//  Copyright © 2017年 王兴文. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWAnimationImageView : UIImageView

@property (nonatomic,assign)CGRect circleRect;
//动画自定义封装
-(void)animationWithViewisPresentFromImageView:(BOOL)isPresent;
@end
