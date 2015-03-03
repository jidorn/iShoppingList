//
//  Product.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "Product.h"

@implementation Product

@synthesize idProduct = idProduct_;
@synthesize name = name_;
@synthesize quantity = quantity_;
@synthesize price = price_;

-(id)initWithIdProduct:(NSInteger*)i name:(NSString*)n quantity:(NSInteger*)q price:(float)p{
    if ((self = [super init])) {
        self.idProduct=i;
        self.name=n;
        self.quantity=q;
        self.price=p;
    }
    return self;
}

@end

