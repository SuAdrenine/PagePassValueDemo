//
//  RootViewControllerTwo.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "RootViewControllerTwo.h"
#import "DetailViewControllerTwo.h"

@interface RootViewControllerTwo ()

@property(nonatomic , strong) UILabel *showLabel;

@end

@implementation RootViewControllerTwo

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Block传值";
    self.view.backgroundColor = [UIColor whiteColor];
    
    //定义一个按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20,300,CGRectGetWidth(self.view.bounds) - 40 , 40);
    button.backgroundColor = [UIColor blueColor];
    [button setTitle:@"下一页" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];
    
    //定义一个显示控件
    self.label = [[UILabel alloc] initWithFrame:CGRectMake(20,100, CGRectGetWidth(self.view.bounds) - 40 , 40)];
    self.label.backgroundColor = [UIColor purpleColor];
    self.label.text = @"用于显示从后面页面返回的数据";//为了显示第二个视图控制器传过来的字符串
    self.label.textColor = [UIColor whiteColor];
    [self.view addSubview:self.label];
}

-(void)clickAction:(id)sender{
    
//    tf = (UITextField *)[self.view viewWithTag:1000];
    DetailViewControllerTwo * dVC =[[DetailViewControllerTwo alloc] init];//相对应的将其实例化，否则找不到相应的属性
    
    //回调方法将输入框中的数据 传输过来
    
    [dVC returnText:^(NSString *showText) {
        
        self.label.text = showText;
        
    }];
    
    [self.navigationController pushViewController:dVC animated:YES];
    
}
@end
