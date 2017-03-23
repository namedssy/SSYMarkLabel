//
//  SSYDemoViewController.m
//  SSYMarkLabel
//
//  Created by 邵仕宇 on 2017/3/23.
//  Copyright © 2017年 punch. All rights reserved.
//

#import "SSYDemoViewController.h"
#import "SSYProgressLabel.h"        //**自定义label*/

#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
#define ScreenHeight [UIScreen mainScreen].bounds.size.height

@interface SSYDemoViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>

@property (nonatomic , strong)UITableView *tableView;

@property (nonatomic , strong)SSYProgressLabel *footerLabel;//*footer*/

@end

@implementation SSYDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self createUI];
    
}

#pragma mark ----------- 创建UI -----------

- (void)createUI {
    [self.view addSubview:self.tableView];
}

#pragma mark ----------- UITableViewDelegate && UITableViewDataSource -----------

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cell"];
    }
    
    cell.textLabel.text = @"测试测试";
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    
    return self.footerLabel;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 135;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
//    NSLog(@"%f",scrollView.contentOffset.y + 64);
    
    if (scrollView.contentOffset.y + 64 > 0) {
        self.footerLabel.clipWidth = (scrollView.contentOffset.y + 64) * 2;
    }
}

#pragma mark ----------- 懒加载 -----------

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.backgroundColor = [UIColor whiteColor];
    }
    return _tableView;
}

- (SSYProgressLabel *)footerLabel {
    if (!_footerLabel) {
        _footerLabel = [[SSYProgressLabel alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 135)];
        _footerLabel.text = @"P U N J E C T";
        _footerLabel.font = [UIFont systemFontOfSize:58];
        _footerLabel.backgroundTextColor = [UIColor lightGrayColor];
        _footerLabel.foregroundTextColor = [UIColor orangeColor];
    }
    return _footerLabel;
}

@end
