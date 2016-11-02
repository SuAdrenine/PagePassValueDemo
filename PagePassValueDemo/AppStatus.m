//
//  AppState.m
//  PagePassValueDemo
//
//  Created by xiebangyao on 2016/11/2.
//  Copyright © 2016年 xiebangyao. All rights reserved.
//

#import "AppStatus.h"

@implementation AppStatus
@synthesize contextStr = _contextStr;

static AppStatus *_instance = nil;

+(AppStatus *)shareInstance
{
    if (_instance == nil)
    {
        _instance = [[super alloc]init];
    }
    return _instance;
}

-(id)init
{
    if (self = [super init])
    {
        
    }
    return self;
}

@end
