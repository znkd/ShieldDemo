//
//  NSObjectStub.m
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import "NSObjectStub.h"
#import <objc/runtime.h>

@implementation NSObjectStub

+(BOOL)resolveInstanceMethod:(SEL)sel
{
    class_addMethod([self class], sel, (IMP)addNewResolveMethod, "v@:@");
    
    return YES;
}

void/*id*/ addNewResolveMethod(id self,SEL sel)
{
    NSLog(@"resolve: %@,%@",NSStringFromClass([self class]),NSStringFromSelector(sel));
    return ;
}

@end
