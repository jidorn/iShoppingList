//
//  FunctionUser.h
//  iShoppingList
//
//  Created by Etudiant on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"
@interface FunctionUser : UIViewController

+ (User*) subscribeWithUser: (User*) user andPassword: (NSString*) password;

@end
