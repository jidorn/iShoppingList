//
//  ShoppingListWebService.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShoppingList.h"

@interface ShoppingListWebService : UIViewController

+(ShoppingList*)createShoppingListWithToken:(NSString*)tokenUser andShopphingListName:(NSString*)name;

+(NSArray*) ListOfShoppingListWithToken:(NSString*)tokenUser;

+(BOOL) editShoppingLIstWithToken:(NSString*)tokenUser andShoppingListId:(NSInteger*)idList andShoppingListName:(NSString*)ShoppingListName andCompletedShoppingList:(BOOL)completedList;

@end
