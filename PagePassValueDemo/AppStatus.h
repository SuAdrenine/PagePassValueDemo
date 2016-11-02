//
//  AppState.h
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/2.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppStatus : NSObject {
    NSString *_contextStr;
}

@property(nonatomic,retain)NSString *contextStr;

+(AppStatus *)shareInstance;

@end
