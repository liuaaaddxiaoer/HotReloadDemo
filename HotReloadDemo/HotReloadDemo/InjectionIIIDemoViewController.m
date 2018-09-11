//
//  InjectionIIIDemoViewController.m
//  HotReloadDemo
//
//  Created by 刘小二 on 2018/9/11.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import "InjectionIIIDemoViewController.h"
#import <YogaKit/UIView+Yoga.h>
#import "HeadView.h"
@interface InjectionIIIDemoViewController ()
@property (nonatomic, strong) UITableView * tableView;
@end

@implementation InjectionIIIDemoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initViews];
}

- (void)injected {
    [self initViews];
}

- (void)initViews {
        
    [self.view configureLayoutWithBlock:^(YGLayout * yoga) {
        yoga.isEnabled = YES;
    }];

    [self.tableView configureLayoutWithBlock:^(YGLayout * yoga) {
        yoga.isEnabled = YES;
        yoga.height = YGPercentValue(80);
    }];
    
    self.tableView.tableHeaderView = [[HeadView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 120)];
}

- (void)viewWillLayoutSubviews {
    [self.view.yoga applyLayoutPreservingOrigin:NO];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor redColor];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
