//
//  SSYProgressLabel.m
//  SSYMarkLabel
//
//  Created by 邵仕宇 on 2017/3/23.
//  Copyright © 2017年 punch. All rights reserved.
//

#import "SSYProgressLabel.h"

@interface SSYProgressLabel()

@property (nonatomic , strong)UILabel *foregroundLabel;//*前景label*/
@property (nonatomic , strong)UILabel *backgroundLabel;//*北京label*/

@property (nonatomic , strong)UIView *clipView;        //*进度view*/

@end

@implementation SSYProgressLabel

#pragma mark ----------- 不支持此初始化方法 -----------
- (instancetype)init {
    return nil;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    if (self = [super initWithCoder:aDecoder]) {
        
    }
    return self;
}

#pragma mark ----------- 初始化方法 -----------
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.backgroundLabel];
        [self addSubview:self.clipView];
        [self.clipView addSubview:self.foregroundLabel];
        
    }
    return self;
}

#pragma mark ----------- set方法 -----------

- (void)setClipWidth:(CGFloat)clipWidth {
    _clipWidth = clipWidth;
    CGRect rect = self.clipView.frame;
    rect.size.width = _clipWidth;
    self.clipView.frame = rect;
}

- (void)setProgress:(CGFloat)progress {
    _progress = progress;
    CGRect rect = self.clipView.frame;
    rect.size.width = self.frame.size.width * _progress;
    self.clipView.frame = rect;
}

- (void)setForegroundTextColor:(UIColor *)foregroundTextColor {
    _foregroundTextColor = foregroundTextColor;
    self.foregroundLabel.textColor = _foregroundTextColor;
}

- (void)setBackgroundTextColor:(UIColor *)backgroundTextColor {
    _backgroundTextColor = backgroundTextColor;
    self.backgroundLabel.textColor = _backgroundTextColor;
}

- (void)setText:(NSString *)text {
    _text = text;
    self.foregroundLabel.text = _text;
    self.backgroundLabel.text = _text;
}

- (void)setFont:(UIFont *)font {
    _font = font;
    self.foregroundLabel.font = _font;
    self.backgroundLabel.font = _font;
}


#pragma mark ----------- 懒加载 -----------

- (UILabel *)foregroundLabel {
    if (_foregroundLabel == nil) {
        _foregroundLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _foregroundLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _foregroundLabel;
}

- (UILabel *)backgroundLabel {
    if (_backgroundLabel == nil) {
        _backgroundLabel = [[UILabel alloc]initWithFrame:self.bounds];
        _backgroundLabel.textAlignment = NSTextAlignmentCenter;
    }
    return _backgroundLabel;
}

- (UIView *)clipView {
    if (_clipView == nil) {
        _clipView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, self.bounds.size.height)];
        _clipView.backgroundColor = [UIColor clearColor];
        _clipView.clipsToBounds = YES;
    }
    return _clipView;
}

@end
