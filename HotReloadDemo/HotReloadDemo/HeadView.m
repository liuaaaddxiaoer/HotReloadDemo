//
//  HeadView.m
//  HotReloadDemo
//
//  Created by 刘小二 on 2018/9/11.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import "HeadView.h"
#import <YogaKit/UIView+Yoga.h>
#import "UIImage+hotReload.h"
IB_DESIGNABLE
@implementation HeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    
    CGRect newFrame = CGRectEqualToRect(frame, CGRectZero) ? (CGRect){{0,0},{345,100}} : frame;
    
    self = [super initWithFrame: newFrame];
    if (self) {
        [self initViews];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initViews];
    }
    return self;
}

- (void)initViews {
    [self configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.height = YGPointValue(self.frame.size.height);
    }];
    
    UIView *contentView = [UIView new];
    contentView.backgroundColor = [UIColor whiteColor];
    [self addSubview:contentView];
    [contentView configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.height = YGPercentValue(100);
        yoga.flexDirection = YGFlexDirectionRow;
        yoga.paddingTop = yoga.paddingBottom = YGPointValue(10);
    }];
    
    UIImageView *bgImageV = [UIImageView new];
    bgImageV.image = [UIImage imageNamed:@"me_head_back" class:[self class]];
    [contentView addSubview:bgImageV];
    [bgImageV configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.height = YGPercentValue(100);
        yoga.flexGrow = 1;
        yoga.flexDirection = YGFlexDirectionRow;
        yoga.alignItems = YGAlignCenter;
        yoga.paddingLeft = YGPointValue(25);
        yoga.paddingRight = YGPointValue(25);
    }];
    
    UIImageView *avatarImageV = [UIImageView new];
    avatarImageV.image = [UIImage imageNamed:@"head_background" class:[self class]];
    [bgImageV addSubview:avatarImageV];
    [avatarImageV configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.width = YGPointValue(75);
        yoga.aspectRatio = 1;
    }];
    
    UILabel *userNameLabel = [UILabel new];
    userNameLabel.text = @"刘小二";
    userNameLabel.font = [UIFont systemFontOfSize:18];
    userNameLabel.backgroundColor = [UIColor blueColor];
    [bgImageV addSubview:userNameLabel];
    [userNameLabel configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.flexGrow = 1;
        yoga.flexShrink = 1;
        yoga.marginLeft = yoga.marginRight = YGPointValue(5);
    }];
    
    UIImageView *arrowImageV = [UIImageView new];
    arrowImageV.image = [UIImage imageNamed:@"exercise_enter" class:[self class]];
    [bgImageV addSubview:arrowImageV];
    [arrowImageV configureLayoutWithBlock:^(YGLayout * _Nonnull yoga) {
        yoga.isEnabled = YES;
        yoga.width = YGPointValue(15);
        yoga.height = YGPointValue(20);
    }];
}

- (void)injected {
    [self layoutSubviews];
}

- (void)layoutSubviews {
    [super layoutSubviews];
   [self.yoga applyLayoutPreservingOrigin:NO];
}

@end
