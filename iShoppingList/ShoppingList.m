//
//  ShoppingList.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "ShoppingList.h"

@implementation ShoppingList

@synthesize idShoppingList = idShoppingList_;
@synthesize nameShoppingList = nameShoppingList_;
@synthesize date = date_;
@synthesize completed = completed_;

-(id)initWithIdShoppingList:(NSInteger*)i nameShoppingList:(NSString*)n date:(NSDate*)d completed:(BOOL)c{
    if ((self = [super init])) {
        self.idShoppingList=i;
        self.nameShoppingList=n;
        self.date=d;
        self.completed=c;
    }
    return self;
}

@end

