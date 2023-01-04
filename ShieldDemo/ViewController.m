//
//  ViewController.m
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import "ViewController.h"

#import "MainTabBarViewController.h"

#import "NSObject+Shield.h"
#import "RuntimeHook.h"

#import "ZombieObjectManager.h"
@interface Myobj : NSObject
@end

@implementation Myobj



@end

@interface ViewController ()
@property(nonatomic, strong) MainTabBarViewController* mainVC;
@property(nonatomic, assign) NSObject* innerObj;
@end

@implementation ViewController
+ (void)load{
    NSLog(@"TESTTEST.....");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainVC = [[MainTabBarViewController alloc]initWithNibName:nil bundle:nil];
    self.mainVC.demoStylesArr = @[@"Demo:unRecogizerSelector",@"Demo:ZombieObjectUsed"];
    
    [self.view addSubview:self.mainVC.view];
    [self addChildViewController:self.mainVC];
    
#if 0
    [NSObject initializeWithSwizzling];
    
    id a = @"abc";
    
    [[[NSObject alloc]init] performSelector:@selector(fn)];
//
//    [self performSelector:@selector(fn)];
    
    
//    [RuntimeHook runtimeHook:[self class] originSEL:NSStringFromSelector(@selector(test1)) newClass:[self class] newSEL:NSStringFromSelector(@selector(test2))];
//
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, 1), dispatch_get_main_queue(), ^{
//        [self test1];
//    });
    
    ZombieObjectManager* mgr = [ZombieObjectManager sharedInstance];
    mgr.zombieClassArray = @[@"Myobj"];
    [mgr startZombieObjectMonitor];
    //测试
    _innerObj = [Myobj new];
    
    int i = 0;
    
    [_innerObj performSelector:@selector(abc:)];
    
#endif
    
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
