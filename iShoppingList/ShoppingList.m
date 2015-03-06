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

-(id)initWithIdShoppingList:(NSInteger*)i nameShoppingList:(NSString*)n{
    if ((self = [super init])) {
        self.idShoppingList=i;
        self.nameShoppingList=n;    }
    return self;
}

-(id)initWithJSONData:(NSDictionary *)data{
    if (self = [super init]) {
        self.idShoppingList=[[data objectForKey:@"id"] integerValue];
        self.nameShoppingList = [data objectForKey:@"name"];
    }
    return self;
}

@end

