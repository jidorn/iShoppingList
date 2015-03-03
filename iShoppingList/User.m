//
//  User.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "User.h"

@implementation User

@synthesize lastName = lastName_;
@synthesize firstName = firstName_;
@synthesize email = email_;
@synthesize token = token_;



-(id) initWithFirstName:(NSString *)f lastName:(NSString *)l email:(NSString *)e token:(NSString *)t{
    
    if ((self = [super init])) {
        
        self.lastName=l;
        
        self.firstName=f;
        
        self.email=e;
        
        self.token=t;
        
    }
    
    return self;
    
}

@end