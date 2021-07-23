//
//  NSObject+NSObject_Shield.m
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import "NSObject+Shield.h"
#import "NSObjectStub.h"
#import "RuntimeHook.h"
#import <objc/runtime.h>

@implementation NSObject (Shield)

//+(instancetype)sharedInstance
//{
//    static NSObject* obj;
//    static dispatch_once_t once;
//    dispatch_once(&once, ^{
//        obj = [[NSObject alloc]init];
//        RuntimeHook runtimeHook:(NSString*)origionClass originSEL:(NSString*)originSel newClass:(NSString*)newClass newSEL:(NSString*)newSel
//    });
//
//    return obj;
//}

+(void)initializeWithSwizzling
{
    static dispatch_once_t token;
    
    dispatch_once(&token, ^{
        [RuntimeHook runtimeHook:[NSObject class] originSEL:NSStringFromSelector(@selector(forwardingTargetForSelector:)) newClass:[NSObject class] newSEL:NSStringFromSelector(@selector(stub_forwardingTargetForSelector:))];
    });
    
    
}

- (id)stub_forwardingTargetForSelector:(SEL)aSelector
{
#if 1
    if ([[self class] respondsToSelector:@selector(forwardInvocation:)]) {
        IMP impOfNSObject = class_getMethodImplementation([NSObject class], @selector(forwardInvocation:));
        IMP imp = class_getMethodImplementation([self class], @selector(forwardInvocation:));
        if (imp != impOfNSObject) {
            //NSLog(@"class has implemented invocation");
            return nil;
        }
    }
#else
    if (class_respondsToSelector([self class], @selector(forwardInvocation:))) {
        IMP impOfNSObject = class_getMethodImplementation([NSObject class], @selector(forwardInvocation:));
        IMP imp = class_getMethodImplementation([self class], @selector(forwardInvocation:));
        if (imp != impOfNSObject) {
            //NSLog(@"class has implemented invocation");
            return nil;
        }
    }
#endif
    
    NSObjectStub* stubObj = [[NSObjectStub alloc]init];
    
    return stubObj;
}

@end
