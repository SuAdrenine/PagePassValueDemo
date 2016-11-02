//
//  DetailViewControllerTwo.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "DetailViewControllerTwo.h"
#import "RootViewControllerTwo.h"

@implementation DetailViewControllerTwo

- (void)viewDidLoad {
    
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //定义一个输入框 将文字传给第一个界面，并且显示在UILabel上
    
    self.tf = [[UITextField alloc]initWithFrame:CGRectMake(20,100,CGRectGetWidth(self.view.bounds) - 40 , 40)];
    
    self.tf.tintColor = [UIColor orangeColor];
    
    self.tf.backgroundColor = [UIColor greenColor];
    self.tf.placeholder = @"请输入内容";
    
    [self.view addSubview:self.tf];
    
    //定义一个按钮
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20,300,CGRectGetWidth(self.view.bounds) - 40 , 40);
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"返回" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:button];

}

//在第一个界面传进来一个Block语句块的函数
//把传进来的Block语句块保存到本类的实例变量returnTextBlock（.h中定义的属性）中，然后寻找一个时机调用
-(void)returnText:(ReturnTextBlock)block{
    self.returnTextBlock = block;
}

//而这个时机就是当视图将要消失的时候，需要重写：
-(void)viewWillDisappear:(BOOL)animated{
    if (self.returnTextBlock !=nil) {
        self.returnTextBlock(self.tf.text);
    }
}

-(void)clickAction:(id)sender {
//    if (self.returnTextBlock !=nil) {
//        
//        self.returnTextBlock(self.tf.text);
//        
//        NSLog(@"self.tf.text %@",self.tf.text);
//        
//    }
    [self.navigationController popViewControllerAnimated:NO];
}
@end
