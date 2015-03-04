//
//  CreateShoppingListViewController.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface CreateShoppingListViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *labelCreateShoppingList;
@property (weak, nonatomic) IBOutlet UITextField *shoppingListTF;
@property (strong, nonatomic)User* user;

- (IBAction)createShoppingListButton:(id)sender;

@end
