//
//  ViewController.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "ViewController.h"
#import "RootViewControllerOne.h"
#import "RootViewControllerTwo.h"
#import "RootViewControllerThree.h"
#import "RootViewControllerFour.h"
#import "RootViewControllerFive.h"

#define viewWidth (self.view.frame.size.width)
#define viewHeight (self.view.frame.size.height)

@interface ViewController ()

@property (nonatomic, strong) NSMutableArray *titleArray;

@end

@implementation ViewController
//@synthesize titleArray = _titleArray;


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"五种传值方式";
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadData];
    
    for (int i = 0; i< _titleArray.count;i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(10, i*50+200, viewWidth-20, 40);
        [button setTitle:_titleArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor purpleColor];
        button.titleLabel.textAlignment = NSTextAlignmentCenter;
        button.tag = 101+i;
        
        [button addTarget:self action:@selector(clickAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Private Method
-(void)loadData {
    if (!_titleArray) {
        _titleArray = @[].mutableCopy;
    }
    _titleArray = @[@"属性传值",@"Block传值",@"代理传值",@"单例传值",@"通知传值"].mutableCopy;
}

-(void)clickAction:(id)sender {
    NSInteger i = [sender tag];
    switch (i) {
        case 101:{
            NSLog(@"属性传值");
            [self.navigationController pushViewController:[RootViewControllerOne new] animated:NO];
            break;}
        case 102:{
            NSLog(@"Block传值");
            [self.navigationController pushViewController:[RootViewControllerTwo new] animated:NO];
            break;
        }
        case 103:{
            NSLog(@"代理传值");
            [self.navigationController pushViewController:[RootViewControllerThree new] animated:NO];
            break;
        }
        case 104:{
            NSLog(@"单例传值");
            [self.navigationController pushViewController:[RootViewControllerFour new] animated:NO];
            break;}
        case 105:{
            NSLog(@"通知传值");
            [self.navigationController pushViewController:[RootViewControllerFive new] animated:NO];
            break;
        }
        default:
            break;
    }
}

@end
