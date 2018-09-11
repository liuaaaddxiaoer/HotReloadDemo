//
//  ViewController.m
//  HotReloadDemo
//
//  Created by 刘小二 on 2018/9/11.
//  Copyright © 2018年 刘小二. All rights reserved.
//

#import "ViewController.h"
#import "InjectionIIIDemoViewController.h"
#import "HeadView.h"
@interface ViewController ()
@property (nonatomic, strong) NSArray * items;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initViews];
}

- (void)initViews {
    self.title = @"Hot Reload";
    self.view.backgroundColor = [UIColor blueColor];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 0, 0);
    [self.tableView reloadData];
}

// injectionIII
- (void)injected {
    [self initViews];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *ids = @"ids";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ids];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ids];
    }
    cell.textLabel.text = self.items[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    switch (indexPath.row) {
        case 0:
            {
                InjectionIIIDemoViewController *injecDemo = [InjectionIIIDemoViewController new];
                [self.navigationController pushViewController:injecDemo animated:YES];
            }
            break;
            
        default:
            break;
    }
}

- (NSArray *)items {
    if (!_items) {
        _items = @[@"InjectionIIIDemo"];
    }
    return _items;
}


@end
