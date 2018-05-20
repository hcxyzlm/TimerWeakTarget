//
//  TimerWeakTarget.h
//  LMAudioFM
//
//  Created by zhuo on 2018/5/20.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import <Foundation/Foundation.h>

// 不会内存泄漏的timer类封装

// 因为这里的穿进去的target是TimerWeakTarget这个target, nstimer强引用TimerWeakTarget，然后TimerWeakTarget弱引用vc,所以不会造成保留环

@interface TimerWeakTarget : NSObject

+ (NSTimer *)scheduledTimerWithTimeInterval:(NSTimeInterval)ti target:(id)aTarget selector:(SEL)aSelector userInfo:(id)userInfo repeats:(BOOL)yesOrNo;

@end
