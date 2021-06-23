//
//  ViewController.m
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import "ViewController.h"
#import "NSObject+Shield.h"
#import "RumtimeHook.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [NSObject initializeWithSwizzling];
    
    id a = @"abc";
    
    [[[NSObject alloc]init] performSelector:@selector(fn)];
//
//    [self performSelector:@selector(fn)];
    
    
//    [RumtimeHook runtimeHook:[self class] originSEL:NSStringFromSelector(@selector(test1)) newClass:[self class] newSEL:NSStringFromSelector(@selector(test2))];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1), dispatch_get_main_queue(), ^{
//        [self test1];
//    });
    
}

- (void)test1
{
    NSLog(@"test1");
}

- (void)test2
{
    NSLog(@"test2");
}
@end
