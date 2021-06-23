//
//  NSObject+NSObject_Shield.h
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (Shield)

//+(instancetype)sharedInstance;
+(void)initializeWithSwizzling;

@end

NS_ASSUME_NONNULL_END
