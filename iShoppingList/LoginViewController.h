//
//  LoginViewController.h
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "User.h"

@interface LoginViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *mailTF;

@property (weak, nonatomic) IBOutlet UITextField *passTF;

@property (weak, nonatomic) IBOutlet UILabel *labelLogin;

@property (strong, nonatomic)User* user;

- (IBAction)logButton:(id)sender;

@end
