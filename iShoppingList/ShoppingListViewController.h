//
//  ShoppingListViewController.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface ShoppingListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableShoppingListView;
@property (strong, nonatomic)User* user;

- (IBAction)createButton:(id)sender;


@end