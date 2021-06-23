//
//  NSObjectStub.h
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObjectStub : NSObject

+(BOOL)resolveInstanceMethod:(SEL)sel;
@end

NS_ASSUME_NONNULL_END
