//
//  HomeViewController.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "HomeViewController.h"
#import "CreateViewController.h"
#import "LoginViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Home";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)goToCreate:(id)sender {
    CreateViewController * createViewController = [CreateViewController new];
    [self.navigationController pushViewController:createViewController animated:YES];
}

- (IBAction)goToLogin:(id)sender {
    LoginViewController * loginViewController = [LoginViewController new];
    [self.navigationController pushViewController:loginViewController animated:YES];
}
@end

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
