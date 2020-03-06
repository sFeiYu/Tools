//
//  ViewController.m
//  SemaphoreTest
//
//  Created by KnowChat03 on 2020/3/6.
//  Copyright © 2020 KnowChat03. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *btnStart;
@property (nonatomic, strong) dispatch_semaphore_t semaphoreSatrt;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.semaphoreSatrt = dispatch_semaphore_create(1);
    [_btnStart addTarget:self action:@selector(semaphoreEvent:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)semaphoreEvent:(UIButton *)btn
{
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(self.semaphoreSatrt, DISPATCH_TIME_FOREVER);
        for (int i = 0; i<5; i++) {
            [self fecthWithIndex:i];
        }
        dispatch_semaphore_signal(self.semaphoreSatrt);
    });
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        dispatch_semaphore_wait(self.semaphoreSatrt, DISPATCH_TIME_FOREVER);
        for (int i = 5; i<10; i++) {
            [self fecthWithIndex:i];
        }
        dispatch_semaphore_signal(self.semaphoreSatrt);
    });
    
}

- (void)fecthWithIndex:(int)index
{
//    dispatch_semaphore_wait(self.semaphoreSatrt, DISPATCH_TIME_FOREVER);
    NSLog(@"=======%d****", index);
//    dispatch_semaphore_signal(self.semaphoreSatrt);
}

@end
