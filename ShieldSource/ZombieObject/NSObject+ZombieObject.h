//
//  NSObject+ZombieObject.h
//  ShieldDemo
//
//  Created by eric on 2021/7/23.
//

#import <Foundation/Foundation.h>
//  major branch  change

// major branch change after feature change1

NS_ASSUME_NONNULL_BEGIN

@interface NSObject (ZombieObject)

- (void)danglinng_dealloc;

@property(nonatomic, copy) NSString* aaaafeatureChange;

@end

NS_ASSUME_NONNULL_END
