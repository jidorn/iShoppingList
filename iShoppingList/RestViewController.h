//
//  RestViewController.h
//  iShoppingList
//
//  Created by Amélie Barré on 26/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RestViewController : UIViewController

@property(nonatomic,strong)IBOutlet UILabel* greetingId;
@property(nonatomic,strong)IBOutlet UILabel* greetingContent;

- (IBAction) fetchGreeting;

@end
