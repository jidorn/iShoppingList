//
//  CreateViewController.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CreateViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *mailTF;

@property (weak, nonatomic) IBOutlet UITextField *nameTF;

@property (weak, nonatomic) IBOutlet UITextField *firstNameTF;

@property (weak, nonatomic) IBOutlet UITextField *passwordTF;

@property (weak, nonatomic) IBOutlet UILabel *labelResponse;

- (IBAction)createUser:(id)sender;


@end
