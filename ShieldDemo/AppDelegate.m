//
//  AppDelegate.m
//  ShieldDemo
//
//  Created by eric on 2021/6/23.
//

#import "AppDelegate.h"
#import <objc/runtime.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    int numClasses;
    Class * classes = NULL;
        
    classes = NULL;
    numClasses = objc_getClassList(NULL, 0);
        
    if (numClasses > 0 )
    {
       classes = (Class*)malloc(sizeof(Class) * numClasses);
       numClasses = objc_getClassList(classes, numClasses);
       
       for(int idx = 0; idx < numClasses; ++idx){
           Class cls = *(classes + idx);
           
           const char *className = object_getClassName(cls);
           Class metaCls = objc_getMetaClass(className);
           
           BOOL hasLoad = NO;
           unsigned int methodCount = 0;
           Method *methods = class_copyMethodList(metaCls, & methodCount);
           if(methods){
               for(int j = 0; j < methodCount; ++j){
                   Method method = *(methods + j);
                   SEL name = method_getName(method);
                   NSString *methodName = NSStringFromSelector(name);
                   if([methodName isEqualToString:@"load"]){
                       hasLoad = YES;
                       break;
                   }
               }
           }
           
           if(hasLoad){
               NSLog(@"has load : %@", NSStringFromClass(cls));
           }else{
    //                NSLog(@"not has load : %@", NSStringFromClass(cls));
           }
       }
       
       free(classes);
    }
    
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
