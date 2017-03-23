//
//  SSYProgressLabel.h
//  SSYMarkLabel
//
//  Created by 邵仕宇 on 2017/3/23.
//  Copyright © 2017年 punch. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SSYProgressLabel : UIView

@property (nonatomic , assign)CGFloat clipWidth;//*进度控制视图*/
@property (nonatomic , assign)CGFloat progress;//*进度（0，1）*/

@property (nonatomic , strong)UIColor *foregroundTextColor;//*前景字体颜色*/
@property (nonatomic , strong)UIColor *backgroundTextColor;//*背景字体颜色*/

@property (nonatomic , strong)NSString *text;//*内容*/
@property (nonatomic , strong)UIFont *font;//*大小*/

@end
