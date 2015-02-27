//
//  main.m
//  iShoppingList
//
//  Created by etudiant on 25/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "User.h"
#import "FunctionUser.h"

int main(int argc, char * argv[])
{
    @autoreleasepool {

        User* user = [FunctionUser subscribeWithEmail:@"test2@gmail.com" andLastName:@"Louis" andFirstName:@"Sebastien" andPassword:@"123"];
        NSLog(@"User : %@", user);
        
        
    }
}
