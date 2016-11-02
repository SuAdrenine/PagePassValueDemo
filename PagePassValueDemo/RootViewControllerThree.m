//
//  RootViewControllerThree.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "RootViewControllerThree.h"
#import "DetailViewControllerThree.h"

@interface RootViewControllerThree () <PassingValueDeletegate>

@property (nonatomic, strong) UILabel *showLabel;

@end

@implementation RootViewControllerThree
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"代理传值";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.showLabel];
    
    
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 300, CGRectGetWidth(self.view.bounds)-40, 40);
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    button.backgroundColor = [UIColor greenColor];
    
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UILabel *)showLabel {
    if (!_showLabel) {
        _showLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 200, CGRectGetWidth(self.view.bounds)-40, 40)];
    }
    _showLabel.text = @"用于显示后面页面传过来的值";
    _showLabel.textColor = [UIColor whiteColor];
    _showLabel.backgroundColor = [UIColor purpleColor];
    return _showLabel;
}

-(void)clickAction:(id)sender {
    DetailViewControllerThree *dVC = [[DetailViewControllerThree alloc] init];

    dVC.delegate = self;
    
    [self.navigationController pushViewController:dVC animated:NO];
}

-(void)viewController:(DetailViewControllerThree *)viewController didPassingValueWithInfo:(id)info {
    _showLabel.text = info;
}

@end
