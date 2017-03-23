//
//  ViewController.m
//  SSYMarkLabel
//
//  Created by 邵仕宇 on 2017/3/23.
//  Copyright © 2017年 punch. All rights reserved.
//

#import "ViewController.h"
#import "SSYProgressLabel.h"
#import "SSYDemoViewController.h"

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface ViewController ()

//形式1
@property (nonatomic , strong)SSYProgressLabel *progressLabel1;//**/
@property (nonatomic , strong)UIButton *button1;//**/
@property (nonatomic , strong)NSTimer *time1;
//形式2
@property (nonatomic , strong)SSYProgressLabel *progressLabel2;//**/
@property (nonatomic , strong)UIButton *button2;//**/
@property (nonatomic , strong)NSTimer *time2;//**/

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemPlay target:self action:@selector(gotoNext)];
    
    [self createUI];

}

#pragma mark ----------- 添加UI -----------

- (void)createUI {
    
    [self.view addSubview:self.progressLabel1];
    [self.view addSubview:self.progressLabel2];
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    
}

#pragma mark ----------- 点击事件响应 -----------

- (void)button1Click:(UIButton *)sender {
    
    if (!sender.selected) {
        _time1 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(progress1) userInfo:nil repeats:YES];
    }else{
        [_time1 invalidate];
    }
    
    sender.selected = !sender.selected;
    
}

- (void)button2Click:(UIButton *)sender {
    
    if (!sender.selected) {
        _time2 = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(progress2) userInfo:nil repeats:YES];
    }else {
        [_time2 invalidate];
    }
    
    sender.selected = !sender.selected;
    
}

- (void)gotoNext {
    [self.navigationController pushViewController:[[SSYDemoViewController alloc]init] animated:YES];
}

#pragma mark ----------- Method -----------

- (void)progress1 {
    
    static BOOL flag;
    
    if (!flag) {
        self.progressLabel1.clipWidth ++;
        if (self.progressLabel1.clipWidth > self.progressLabel1.frame.size.width) {
            flag = !flag;
        }
    }
    else{
        _progressLabel1.clipWidth --;
        if (self.progressLabel1.clipWidth == 0) {
            flag = !flag;
        }
    }
}

- (void)progress2 {
    
    self.progressLabel2.progress += 0.01;
    if (self.progressLabel2.progress >= 1) {
        self.progressLabel2.progress = 0;
    }
}

#pragma mark ----------- 懒加载 -----------

- (SSYProgressLabel *)progressLabel1 {
    if (_progressLabel1 == nil) {
        _progressLabel1 = [[SSYProgressLabel alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
        _progressLabel1.center = CGPointMake(ScreenWidth / 2, 50 + 64);
        _progressLabel1.backgroundColor = [UIColor whiteColor];
        _progressLabel1.backgroundTextColor = [UIColor lightGrayColor];
        _progressLabel1.foregroundTextColor = [UIColor orangeColor];
        _progressLabel1.text = @"我就是我，是颜色不一样的烟火";
        _progressLabel1.font = [UIFont systemFontOfSize:20];

    }
    return _progressLabel1;
}

- (SSYProgressLabel *)progressLabel2 {
    if (_progressLabel2 == nil) {
        _progressLabel2 = [[SSYProgressLabel alloc] initWithFrame:CGRectMake(0, self.progressLabel1.bounds.origin.y + self.progressLabel1.frame.size.height + 100, 300, 50)];
        _progressLabel2.center = CGPointMake(ScreenWidth / 2, 100 + 64);
        _progressLabel2.backgroundColor = [UIColor whiteColor];
        _progressLabel2.backgroundTextColor = [UIColor lightGrayColor];
        _progressLabel2.foregroundTextColor = [UIColor orangeColor];
        _progressLabel2.text = @"天空海阔，要做最坚强的泡沫";
        _progressLabel2.font = [UIFont systemFontOfSize:20];
        
    }
    return _progressLabel2;
}

- (UIButton *)button1 {
    if (_button1 == nil) {
        _button1 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button1.frame = CGRectMake(self.progressLabel1.bounds.origin.x + 50, self.progressLabel2.bounds.origin.y + self.progressLabel2.frame.size.height + 150, 100, 50);
        [_button1 setTitle:@"模式一" forState:UIControlStateNormal];
        [_button1 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button1.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_button1];
        [_button1 addTarget:self action:@selector(button1Click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button1;
}

- (UIButton *)button2 {
    if (_button2 == nil) {
        _button2 = [UIButton buttonWithType:UIButtonTypeCustom];
        _button2.frame = CGRectMake(self.progressLabel1.bounds.origin.x + 200, self.progressLabel2.bounds.origin.y + self.progressLabel2.frame.size.height + 150, 100, 50);
        [_button2 setTitle:@"模式二" forState:UIControlStateNormal];
        [_button2 setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _button2.backgroundColor = [UIColor blackColor];
        [self.view addSubview:_button1];
        [_button2 addTarget:self action:@selector(button2Click:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _button2;
}



@end
