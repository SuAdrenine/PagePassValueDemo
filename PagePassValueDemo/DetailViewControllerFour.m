//
//  DetailViewControllerFour.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "DetailViewControllerFour.h"
#import "AppStatus.h"

@interface DetailViewControllerFour ()

@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UITextField *textField;

@end

@implementation DetailViewControllerFour

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.label.frame = CGRectMake(20, 100, CGRectGetWidth(self.view.bounds) -40, 40);
    self.label.backgroundColor = [UIColor greenColor];
    [self.view addSubview:self.label];
    
    self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 200, CGRectGetWidth(self.view.bounds) -40, 40)];
    self.textField.placeholder = @"请输入内容";
    self.textField.backgroundColor = [UIColor purpleColor];
    self.textField.textColor = [UIColor whiteColor];
    [self.view addSubview:self.textField];
    
    UIButton *button =[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 300, CGRectGetWidth(self.view.bounds) -40, 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"发送" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doneAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)viewWillAppear:(BOOL)animated {
    if ([AppStatus shareInstance].contextStr.length !=0) {
        self.label.text = [AppStatus shareInstance].contextStr;
    } else {
        self.label.text = @"用于现实前面页面传递过来的值";
    }
}

//pop回前一个页面
-(void)doneAction:(id)sender {
    //单例传值
    [AppStatus shareInstance].contextStr = _textField.text;
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - Getter & Setter
LabelGetter(label, NSTextAlignmentCenter, ColorFromRGB(0xffffff), [UIFont systemFontOfSize:15])


@end
