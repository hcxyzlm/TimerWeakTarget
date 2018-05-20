//
//  WeakTimerVC.m
//  TimerWeakTarget
//
//  Created by zhuo on 2018/5/20.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import "WeakTimerVC.h"

#import "TestTimerVC.h"
#import "NSTimer+WeakTarget.h"
#import "TimerWeakTarget.h"

@interface WeakTimerVC ()

@property (nonatomic, strong) NSTimer *timer;

@end

@implementation WeakTimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"timer的内存泄漏测试";
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
    [self.timer invalidate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    /* +++++++++++++++++++++++++++++*/
    /*第一种tiemr, 会发生内存泄漏*/
    //    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(p_doPoll) userInfo:nil repeats:YES];
    
    
    /*第一种分类tiemr, 不会发生内存泄漏*/
    __weak WeakTimerVC *weakSelf = self;
        self.timer = [NSTimer weakTarget_scheduledTimerWithTimeInterval:2 repeats:YES block:^{
            
            WeakTimerVC *strongVC = weakSelf;
            [strongVC p_doPoll];
        }];
    
    /*第三种封装tiemr, 不会发生内存泄漏*/
//    self.timer = [TimerWeakTarget scheduledTimerWithTimeInterval:2 target:self selector:@selector(p_doPoll) userInfo:nil repeats:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (void)stopPoling {
    
    [self.timer invalidate];
    self.timer = nil;
}

- (void)p_doPoll {
    
    NSLog(@"%s", __FUNCTION__);
}


@end
