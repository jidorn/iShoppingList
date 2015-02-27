//
//  FunctionUser.h
//  iShoppingList
//
//  Created by Etudiant on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface UserWebService : UIViewController

+ (User*) subscribeWithEmail: (NSString*) email andLastName: (NSString*) lastName andFirstName: (NSString*)firstName andPassword: (NSString*) password;
+ (User*) loginWithEmail: (NSString*) email andPassword: (NSString*) password;

@end
