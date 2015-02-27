//
//  ProductWebServiceViewController.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Product.h"
#import "User.h"

@interface ProductWebService : UIViewController

+(Product*)createProduct:(NSString*)tokenUser andIdShoppingList:(NSInteger*)IdShop andNameProduct:(NSString*)name andQuantity:(NSInteger*)quantity andPrice:(double)price;

+(NSArray*)ListOfProductWithToken:(NSString*)tokenUser andShoppingListId:(NSInteger*)idList;

@end
