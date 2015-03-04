//
//  ShoppingList.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingList : NSObject{
@private
    NSInteger* idShoppingList_;
    NSString* nameShoppingList_;
    NSDate* date_;
    BOOL completed_;
}

@property (nonatomic) NSInteger* idShoppingList;
@property (nonatomic, strong) NSString* nameShoppingList;

-(id)initWithIdShoppingList:(NSInteger*)i nameShoppingList:(NSString*)n;

@end

