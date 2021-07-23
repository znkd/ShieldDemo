//
//  ZombieObjectManager.h
//  ShieldDemo
//
//  Created by eric on 2021/7/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZombieObjectManager : NSObject

@property(nonatomic, strong) NSArray* zombieClassArray;

+ (id)sharedInstance;

- (void)startZombieObjectMonitor;

- (void)stopZombieObjectMonitor;
@end

NS_ASSUME_NONNULL_END
