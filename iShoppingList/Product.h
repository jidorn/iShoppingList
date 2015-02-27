//
//  Product.h
//  iShoppingList
//
//  Created by Etudiant on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Product : NSObject{

@private

NSInteger* idProduct_;
NSString* nameProduct_;
NSInteger* quantityProduct_;
float priceProduct_;
}

@property (nonatomic) NSInteger* idProduct;

@property (nonatomic, strong) NSString* nameProduct;

@property (nonatomic) NSInteger* quantityProduct;

@property (nonatomic) float priceProduct;

@end
