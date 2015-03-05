//
//  ProductListViewController.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 05/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProductListViewController : UIViewController

- (IBAction)addProductButton:(id)sender;


@property (weak, nonatomic) IBOutlet UITableView *productList;


@end
