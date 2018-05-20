//
//  TimerWeakTarget.m
//  LMAudioFM
//
//  Created by zhuo on 2018/5/20.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import "TimerWeakTarget.h"

@interface TimerWeakTarget ()

@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, assign) SEL selector;
@property (nonatomic, weak) id target;// 这里是弱引用不会有保留环

@end

@implementation TimerWeakTarget

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo {
    
    TimerWeakTarget *weakTimer = [[TimerWeakTarget alloc] init];
    weakTimer.target = aTarget;
    weakTimer.selector = aSelector;
    
    weakTimer.timer = [NSTimer scheduledTimerWithTimeInterval:ti target:weakTimer selector:@selector(invoke_timer:) userInfo:userInfo repeats:yesOrNo];
    
    return  weakTimer.timer;
}

- (void)invoke_timer:(NSTimer *)timer {
    
    if (self.target) {
        [self.target performSelector:self.selector withObject:timer.userInfo];
    }else {
        [timer invalidate];
    }
}

@end
