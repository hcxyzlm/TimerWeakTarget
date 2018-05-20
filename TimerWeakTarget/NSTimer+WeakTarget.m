//
//  NSTimer+WeakTarget.m
//  LMAudioFM
//
//  Created by zhuo on 2018/5/19.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import "NSTimer+WeakTarget.h"

@implementation NSTimer (WeakTarget)

+ (NSTimer *)weakTarget_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void(^)(void))block {
    
    return [NSTimer scheduledTimerWithTimeInterval:ti target:self selector:@selector(invoke_Block:) userInfo:[block copy] repeats:yesOrNo];
}

+ (void)invoke_Block:(NSTimer *)timer {
    
    void (^block)(void) = timer.userInfo;
    if (block) {
        block();
    }
    
}

@end
