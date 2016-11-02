//
//  RootViewControllerFour.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "RootViewControllerFour.h"
#import "AppStatus.h"
#import "DetailViewControllerFour.h"

@interface RootViewControllerFour ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation RootViewControllerFour

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"单例传值";
    
    //核心代码
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    btn.frame = CGRectMake(20, 300, CGRectGetWidth(self.view.bounds) -40, 40);
    [btn setTitle:@"Push" forState:UIControlStateNormal];
    btn.backgroundColor = [UIColor redColor];
    [btn addTarget:self action:@selector(pushAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [self.view addSubview:self.textField];
    self.label.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) -40, 40);
    
    self.label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.label];
}

-(void)viewWillAppear:(BOOL)animated {
    if ([AppStatus shareInstance].contextStr.length !=0) {
        self.label.text = [AppStatus shareInstance].contextStr;
    } else {
        self.label.text = @"用于现实后面页面传递过来的值";
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(UITextField *)textField {
    if (!_textField) {
        _textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, CGRectGetWidth(self.view.bounds)-40, 40)];
    }
    _textField.placeholder = @"请输入内容";
    _textField.backgroundColor = [UIColor purpleColor];
    _textField.textColor = [UIColor whiteColor];
    return _textField;
}

-(void)pushAction:(id)sender
{
//    _textField = (UITextField *)[self.view viewWithTag:1000];
    
    //单例传值  将要传递的信息存入单例中（共享中）
    //  [[AppStatus shareInstance]setContextStr:tf.text]; 跟下面这种写法是等价的
    [AppStatus shareInstance].contextStr = _textField.text;
    //导航push到下一个页面
    //pushViewController 入栈引用计数+1，且控制权归系统
    DetailViewControllerFour *detailViewController = [[DetailViewControllerFour alloc]init];
    
    //导航push到下一个页面
    [self.navigationController pushViewController:detailViewController animated:YES];
    
}

#pragma mark - Getter & Setter
LabelGetter(label, NSTextAlignmentCenter, ColorFromRGB(0xffffff), [UIFont systemFontOfSize:15])

@end
