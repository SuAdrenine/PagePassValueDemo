//
//  RootViewControllerOne.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "RootViewControllerOne.h"
#import "DetailViewControllerOne.h"

@interface RootViewControllerOne ()

@property(nonatomic , strong) UITextField *textField;

@end

@implementation RootViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"属性传值";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    
    // 创建一个轻拍手势，当点击屏幕任何一个地方，就取消键盘的第一响应
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTap:)];
    [self.view addGestureRecognizer:tap];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 200, CGRectGetWidth(self.view.bounds)-40, 40);
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

-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds)-40, 40)];
        _textField.backgroundColor = [UIColor greenColor];
        _textField.placeholder = @"请输入内容";
        
    }
    return _textField;
}

- (void)handleTap:(id)sender {
    [_textField resignFirstResponder];
}

-(void)clickAction:(id)sender {
    DetailViewControllerOne *dVC = [[DetailViewControllerOne alloc] init];
    dVC.textString = self.textField.text;
    [self.navigationController pushViewController:dVC animated:NO];
}
@end
