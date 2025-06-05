//
//  ViewController.m
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//
#import <sys/sysctl.h>
#import <sys/types.h>
#import "ViewController.h"

#import "MainTabBarViewController.h"

//#import "NSObject+Shield.h"
#import "RuntimeHook.h"

#import "ZombieObjectManager.h"

// 获取进程启动时间（秒）
NSTimeInterval getProcessStartTime() {
    // 获取进程信息
    struct kinfo_proc procInfo;
    int pid = [[NSProcessInfo processInfo] processIdentifier];
    int cmd[4] = {CTL_KERN, KERN_PROC, KERN_PROC_PID, pid};
    size_t size = sizeof(procInfo);
    
    if (sysctl(cmd, 4, &procInfo, &size, NULL, 0) == 0) {
        // 获取进程启动时间戳（秒）
        struct timeval startTime = procInfo.kp_proc.p_starttime;
        NSTimeInterval timeInSeconds = startTime.tv_sec + (startTime.tv_usec / 1000000.0);
        return timeInSeconds;
    }
    
    return 0;
}
// 获取系统启动时间（秒）
NSTimeInterval getSystemBootTime() {
    struct timeval boottime;
    size_t len = sizeof(boottime);
    int mib[2] = { CTL_KERN, KERN_BOOTTIME };
    
    if (sysctl(mib, 2, &boottime, &len, NULL, 0) == 0) {
        return boottime.tv_sec + (boottime.tv_usec / 1000000.0);
    }
    
    return 0;
}

// 获取应用启动耗时（秒）
NSTimeInterval getAppLaunchTime() {
    NSTimeInterval now = [[NSDate date] timeIntervalSince1970];
    NSTimeInterval processStart = getProcessStartTime();
    NSTimeInterval bootTime = getSystemBootTime();
    
    // 计算从进程启动到当前时间的间隔
//    return now - (bootTime + (processStart - (long)processStart));
    return now - (long)processStart;
}

typedef struct {
    const char* key;
    void (*function)(void);
} FunctionEntry;

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
    
    NSProcessInfo* proc_info = [NSProcessInfo processInfo];
    NSTimeInterval interval = [proc_info systemUptime];
    NSTimeInterval processInterval = getProcessStartTime();
    //[NSProcessInfo processInfo].systemUptime - [[NSDate date] timeIntervalSince1970] + [NSDate timeIntervalSinceReferenceDate];
    NSTimeInterval appLaunchTime = getAppLaunchTime();
    BOOL isWarm = proc_info.environment[@"ActivePrewarm"];
    if (interval <= 1.0) {
        NSLog(@"<= 1.0s");
    } else {
        NSLog(@"> 1.0s");
    }
    sleep(2);
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.mainVC = [[MainTabBarViewController alloc]initWithNibName:nil bundle:nil];
    self.mainVC.demoStylesArr = @[@"Demo:unRecogizerSelector",@"Demo:ZombieObjectUsed"];
    
    [self.view addSubview:self.mainVC.view];
    [self addChildViewController:self.mainVC];
    NSTimeInterval appLaunchTime = getAppLaunchTime();
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
