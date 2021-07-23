//
//  ZombieObjectStub.h
//  ShieldDemo
//
//  Created by eric on 2021/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZombieObjectStub : NSProxy

@property(nonatomic, assign) Class originClass;

- (instancetype)init;

@end

NS_ASSUME_NONNULL_END
