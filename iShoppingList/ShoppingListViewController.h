//
//  ShoppingListViewController.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShoppingListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableSoppingList;

- (IBAction)homeButton:(id)sender;

- (IBAction)createButton:(id)sender;


@end
