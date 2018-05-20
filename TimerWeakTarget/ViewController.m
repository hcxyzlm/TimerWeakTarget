//
//  ViewController.m
//  TimerWeakTarget
//
//  Created by zhuo on 2018/5/20.
//  Copyright © 2018年 zhuo. All rights reserved.
//

#import "ViewController.h"
#import "WeakTimerVC.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    WeakTimerVC *vc = [[WeakTimerVC alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
