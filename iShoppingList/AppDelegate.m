//
//  AppDelegate.m
//  iShoppingList
//
//  Created by etudiant on 25/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "User.h"

@implementation AppDelegate
@synthesize data_;

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"error : %@",error);
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    data_ = [NSMutableData new];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    if (data) {
        [data_ appendData:data];
    }
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSError* error = nil;
    if (data_) {
        NSMutableDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data_ options:0 error:&error];
    }
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    HomeViewController * viewController = [HomeViewController new];
    window.rootViewController = [[UINavigationController alloc]initWithRootViewController:viewController];
    [window makeKeyAndVisible];
    self.window = window;
    // Override point for customization after application launch.
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
