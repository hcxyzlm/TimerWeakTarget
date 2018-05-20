//
//  WeakTimerVC.h
//  TimerWeakTarget
//
//  Created by zhuo on 2018/5/20.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import <UIKit/UIKit.h>

// 该vc展示了timer会造成内存泄漏，如果pop vc, vc没有dealloc的话就是有内存泄漏

@interface WeakTimerVC : UIViewController

@end
