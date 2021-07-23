//
//  NSObject+ZombieObject.m
//  ShieldDemo
//
//  Created by eric on 2021/7/23.
//

#import <objc/runtime.h>
#import "NSObject+ZombieObject.h"
#import "ZombieObjectManager.h"
#import "ZombieObjectStub.h"
#import <list>

static int maxM = 16*5 ;//(byte)
static std::list<id> needFreeObj;

@implementation NSObject (ZombieObject)

- (void)danglinng_dealloc
{
    ZombieObjectManager* mgr = [ZombieObjectManager sharedInstance];
    BOOL needProtect = NO;
    for (NSString* className in mgr.zombieClassArray) {
        if ([self class] == NSClassFromString(className)) {
            needProtect = YES;
            break;
        }
    }
    
    if (needProtect) {
        objc_destructInstance(self);
        Class originCls = [self class];
        object_setClass(self,[ZombieObjectStub class]);
        ((ZombieObjectStub*)self).originClass = originCls;
        
        if (sizeof(needProtect) > maxM) {
            id front = needFreeObj.front();
            needFreeObj.pop_front();
            free(front);
        }
        
        needFreeObj.push_back(self);
    } else {
        [self danglinng_dealloc];
    }
}

@end
