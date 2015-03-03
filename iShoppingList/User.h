//
//  User.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject{
    
@private
    NSString* firstName_;
    NSString* lastName_;
    NSString* email_;
    NSString* token_;
}



@property (nonatomic, strong) NSString* firstName;

@property (nonatomic, strong) NSString* lastName;

@property (nonatomic, strong) NSString* email;

@property (nonatomic, strong) NSString* token;



-(id)initWithFirstName:(NSString*)f lastName:(NSString*)l email:(NSString*)e token:(NSString*)t;



@end