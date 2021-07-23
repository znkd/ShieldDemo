//
//  RuntimeHook.h
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RuntimeHook : NSObject

+(void)runtimeHook:(Class)origionClass originSEL:(NSString*)originSel newClass:(Class)newClass newSEL:(NSString*)newSel;

@end

NS_ASSUME_NONNULL_END
