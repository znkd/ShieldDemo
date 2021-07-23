//
//  ZombieObjectStub.m
//  ShieldDemo
//
//  Created by eric on 2021/7/23.
//

#import "ZombieObjectStub.h"

@implementation ZombieObjectStub

- (instancetype)init
{
//    if (self = [super init]) {
//        
//    }
    
    return self;
}


#define ZombieObjectException() [self _throwErrorSelector:_cmd]

- (BOOL)respondsToSelector: (SEL)aSelector
{
    return [self.originClass instancesRespondToSelector:aSelector];
}

- (NSMethodSignature*)methodSignatureForSelector:(SEL)sel
{
//    ZombieObjectException();
    Class a = self.originClass;
    return [a instanceMethodSignatureForSelector:sel];
}

- (void)forwardInvocation:(NSInvocation *)invocation
{
    [self _throwErrorSelector:invocation.selector];
}

- (id)performSelector:(SEL)aSelector
{
    ZombieObjectException();
    return nil;
}

//- (Class)class
//{
//    ZombieObjectException();
//    return nil;
//}

- (BOOL)isEqual:(id)object
{
    ZombieObjectException();
    return NO;
}

- (NSUInteger)hash
{
    ZombieObjectException();
    return 0;
}

- (BOOL)isMemberOfClass:(Class)aClass
{
    ZombieObjectException();
    return NO;
}

- (BOOL)isKindOfClass:(Class)aClass
{
    ZombieObjectException();
    return NO;
}

- (BOOL)isProxy
{
    ZombieObjectException();
    return NO;
}

- (id)self
{
    ZombieObjectException();
    return nil;
}

- (BOOL)conformsToProtocol:(Protocol *)aProtocol
{
    ZombieObjectException();
    return NO;
}

- (id)retain
{
    ZombieObjectException();
    return nil;
}

- (oneway void)release
{
    ZombieObjectException();
}

- (id)autorelease
{
    ZombieObjectException();
    return nil;
}

- (void)dealloc
{
    ZombieObjectException();
    [super dealloc];
}

- (NSUInteger)retainCount
{
    ZombieObjectException();
    return 0;
}

- (NSZone *)zone
{
    ZombieObjectException();
    return nil;
}

- (NSString *)description
{
    ZombieObjectException();
    return nil;
}

-(void)_throwErrorSelector:(SEL)sel
{
    @throw [NSException exceptionWithName:NSInternalInconsistencyException reason:[NSString stringWithFormat:@"(-[%@ %@]) was sent to a zombie object at address: %p", NSStringFromClass(self.originClass), NSStringFromSelector(sel), self] userInfo:nil];
}

@end
