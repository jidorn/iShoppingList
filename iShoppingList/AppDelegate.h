//
//  AppDelegate.h
//  iShoppingList
//
//  Created by etudiant on 25/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate, NSURLConnectionDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic)NSMutableData * data_;

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error;

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response;

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data;

-(void)connectionDidFinishLoading:(NSURLConnection *)connection;

@end
