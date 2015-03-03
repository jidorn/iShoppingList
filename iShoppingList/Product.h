//
//  Product.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject{
    
@private
    
    NSInteger* idProduct_;
    NSString* name_;
    NSInteger* quantity_;
    float price_;
}

@property (nonatomic) NSInteger* idProduct;

@property (nonatomic, strong) NSString* name;

@property (nonatomic) NSInteger* quantity;

@property (nonatomic) float price;

-(id)initWithIdProduct:(NSInteger*)i name:(NSString*)n quantity:(NSInteger*)q price:(float)p;

@end

