//
//  DetailViewControllerThree.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "DetailViewControllerThree.h"

@interface DetailViewControllerThree ()

@property (nonatomic, strong) UITextField *textField;

@end

@implementation DetailViewControllerThree

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 300, CGRectGetWidth(self.view.bounds)-40, 40);
    [button setTitle:@"返回" forState:UIControlStateNormal];
    button.backgroundColor = [UIColor blueColor];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    [self.view addSubview:self.textField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    NSString *string;
    
    if ([_textField.text length] == 0) {
        string = @"用户未输入任何内容";
    }else {
        string = _textField.text;
    }
    //视图将要消失，通过代理传值
    //首次判断代理是否存在，并在代理能够响应代理方法时才执行代理方法
    if (self.delegate && [self.delegate respondsToSelector:@selector(viewController:didPassingValueWithInfo:)]) {
        [self.delegate viewController:self didPassingValueWithInfo:string];
    }
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
    [self.navigationController popViewControllerAnimated:NO];
}
@end
