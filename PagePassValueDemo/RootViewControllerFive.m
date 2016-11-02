//
//  RootViewControllerFive.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/2.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "RootViewControllerFive.h"
#import "DetailViewControllerFive.h"

#define xbyNotification @"labelChange"

@interface RootViewControllerFive ()

@property (nonatomic, strong) UILabel *label;

@end

@implementation RootViewControllerFive

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    self.title = @"通知传值";
    
    [self.view addSubview:self.label];
    
    UIButton *button  = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(20, 300, CGRectGetWidth(self.view.bounds)-40, 40);
    [button setTitle:@"点击" forState:UIControlStateNormal];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor blueColor];
    [self.view addSubview:button];
    
    

}

-(void)viewWillAppear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(labelTextChange:) name:xbyNotification object:nil];
}

//-(void)viewWillDisappear:(BOOL)animated {
//    [super viewDidDisappear:animated];
//    [[NSNotificationCenter defaultCenter] removeObserver:self];
//}
-(void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

-(UILabel *)label {
    if (!_label) {
        _label = [[UILabel alloc ] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds)-40, 40)];
        _label.textAlignment = NSTextAlignmentCenter;
        _label.backgroundColor = [UIColor purpleColor];
        _label.text = @"等待接收通知消息";
        _label.textColor = [UIColor whiteColor];
    }
    
    return _label;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)clickAction:(id)sender {
    [self.navigationController pushViewController:[DetailViewControllerFive new] animated:NO];
}

-(void)labelTextChange:(NSNotification *)sender {
    NSDictionary *dic = sender.userInfo;
    self.label.text = dic[@"info"];
//    NSLog(@"收到通知");
}

@end
