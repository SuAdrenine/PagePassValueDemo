//
//  DetailViewControllerTwo.h
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^ReturnTextBlock)(NSString *showText);//重新定义了一个名字

@interface DetailViewControllerTwo :UIViewController

@property (nonatomic,retain)UITextField *tf;

@property (nonatomic,copy) ReturnTextBlock returnTextBlock;//定义的一个Block属性

- (void)returnText:(ReturnTextBlock)block;

@end
