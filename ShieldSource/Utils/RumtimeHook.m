//
//  RumtimeHook.m
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import "RumtimeHook.h"
#import <objc/runtime.h>

@implementation RumtimeHook
+(void)runtimeHook:(Class)origionClass originSEL:(NSString*)originSelName newClass:(Class)newClass newSEL:(NSString*)newSelName
{

    Class originCls = origionClass;
    SEL   originSel = NSSelectorFromString(originSelName);
    Method originMethod = class_getInstanceMethod(originCls, originSel);//class_getClassMethod(originCls, originSel);
    IMP   originImp = class_getMethodImplementation(originCls, originSel);
    
    Class newCls = newClass;
    SEL   newSel = NSSelectorFromString(newSelName);
    Method newMethod = class_getInstanceMethod(newCls, newSel);//class_getClassMethod(newCls, newSel);
    IMP   newImp = class_getMethodImplementation(newCls, newSel);
    
#if 1
    class_addMethod(originCls, originSel, method_getImplementation(originMethod), method_getTypeEncoding(originMethod));
    class_addMethod(newCls, newSel, method_getImplementation(newMethod), method_getTypeEncoding(newMethod));
    
    method_exchangeImplementations(originMethod, newMethod);
    
#else
    
    Method origMethod = class_getInstanceMethod(origionClass, originSel);
    Method replaceMeathod = class_getInstanceMethod(newClass, newSel);
    
    // class_addMethod:如果发现方法已经存在，会失败返回，也可以用来做检查用,我们这里是为了避免源方法没有实现的情况;如果方法没有存在,我们则先尝试添加被替换的方法的实现
    BOOL didAddMethod = class_addMethod(origionClass,
                                        originSel,
                                        method_getImplementation(replaceMeathod),
                                        method_getTypeEncoding(replaceMeathod));
    if (didAddMethod) {
        // 原方法未实现，则替换原方法防止crash
        class_replaceMethod(origionClass,
                            newSel,
                            method_getImplementation(origMethod),
                            method_getTypeEncoding(origMethod));
    }else {
        // 添加失败：说明源方法已经有实现，直接将两个方法的实现交换即
        method_exchangeImplementations(origMethod, replaceMeathod);
    }
#endif
}
@end
