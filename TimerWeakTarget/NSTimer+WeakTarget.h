//
//  NSTimer+WeakTarget.h
//  LMAudioFM
//
//  Created by zhuo on 2018/5/19.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSTimer (WeakTarget)

+ (NSTimer *)weakTarget_scheduledTimerWithTimeInterval:(NSTimeInterval)ti repeats:(BOOL)yesOrNo block:(void(^)(void))block;

@end
