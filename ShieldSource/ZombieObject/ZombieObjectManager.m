//
//  ZombieObjectManager.m
//  ShieldDemo
//
//  Created by eric on 2021/7/23.
//

#import "ZombieObjectManager.h"
#import "NSObject+ZombieObject.h"
#import "RuntimeHook.h"

@implementation ZombieObjectManager

+ (id)sharedInstance
{
    static ZombieObjectManager* _manager ;
    static dispatch_once_t token;
    dispatch_once(&token, ^{
        _manager = [[ZombieObjectManager alloc]init];
    });
    
    return _manager;
}

- (void)startZombieObjectMonitor
{
    [RuntimeHook runtimeHook:[NSObject class] originSEL:@"dealloc" newClass:[NSObject class] newSEL:@"danglinng_dealloc"];
}

- (void)stopZombieObjectMonitor
{
    [RuntimeHook runtimeHook:[NSObject class] originSEL:@"danglinng_dealloc" newClass:[NSObject class] newSEL:@"dealloc"];
}
@end
