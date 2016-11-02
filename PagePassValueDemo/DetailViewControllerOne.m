//
//  DetailViewControllerOne.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "DetailViewControllerOne.h"

@interface DetailViewControllerOne ()

@end

@implementation DetailViewControllerOne

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 100, CGRectGetWidth(self.view.bounds)-40, 30)];
    label.backgroundColor = [UIColor orangeColor];
    label.font = [UIFont systemFontOfSize:20];
    label.numberOfLines = 0;
    label.text = self.textString;
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor greenColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
