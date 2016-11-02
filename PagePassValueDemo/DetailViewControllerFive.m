//
//  DetailViewControllerFive.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/2.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "DetailViewControllerFive.h"

#define xbyNotification @"labelChange"

@interface DetailViewControllerFive ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation DetailViewControllerFive

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.view addSubview:self.textField];
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 300, CGRectGetWidth(self.view.bounds)-40, 40);
    [button setTitle:@"发送通知" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor redColor];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITextField *)textField {
    
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) - 40, 40)];
    }
    _textField.placeholder = @"请输入内容";
    _textField.backgroundColor = [UIColor greenColor];
    
    return _textField;
}

-(void)clickAction:(id)sender {
    [[NSNotificationCenter defaultCenter] postNotificationName:xbyNotification object:self userInfo:@{@"info":_textField.text}];
    [self.navigationController popViewControllerAnimated:NO];
}

@end
