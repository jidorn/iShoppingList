//
//  ShoppingList.h
//  iShoppingList
//
//  Created by Etudiant on 26/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShoppingList : NSObject{
    @private
    NSInteger* id_;
    NSString* name_;
    NSDate* date_;
    BOOL completed_;
}

@property (nonatomic) NSInteger* id;
@property (nonatomic, strong) NSString* name;
@property (nonatomic, strong) NSDate* date;
//@property (nonatomic, weak) BOOL completed;

@end
