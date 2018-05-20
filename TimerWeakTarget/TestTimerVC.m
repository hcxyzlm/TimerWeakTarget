//
//  TestTimerVC.m
//  LMAudioFM
//
//  Created by zhuo on 2018/5/19.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import "TestTimerVC.h"
#import "RACEXTScope.h"
#import "NSTimer+WeakTarget.h"
#import "TimerWeakTarget.h"

@interface TestTimerVC ()

@property (nonatomic, strong) NSTimer *timer; //注释

@end

@implementation TestTimerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)dealloc {
    NSLog(@"%s", __FUNCTION__);
    [self.timer invalidate];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(p_doPoll) userInfo:nil repeats:YES];

    
//    @weakify(self);
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2 repeats:YES block:^(NSTimer * _Nonnull timer) {
//        @strongify(self);
//        [self p_doPoll];
//    }];
    
//    @weakify(self);
//    self.timer = [NSTimer weakTarget_scheduledTimerWithTimeInterval:2 repeats:YES block:^{
//        @strongify(self);
//        [self p_doPoll];
//    }];
    
     self.timer = [TimerWeakTarget scheduledTimerWithTimeInterval:2 target:self selector:@selector(p_doPoll) userInfo:nil repeats:YES];
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
