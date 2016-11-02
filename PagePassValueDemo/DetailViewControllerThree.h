//
//  DetailViewControllerThree.h
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/1.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewControllerThree;
@protocol PassingValueDeletegate <NSObject>

@optional
-(void)viewController:(DetailViewControllerThree *)viewController didPassingValueWithInfo:(id)info;

@end

@interface DetailViewControllerThree : UIViewController

@property(nonatomic, assign) id<PassingValueDeletegate> delegate;//通过代理传值

@end
