//
//  CreateShoppingListViewController.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "CreateShoppingListViewController.h"
#import "User.h"

@interface CreateShoppingListViewController ()

@end

@implementation CreateShoppingListViewController

@synthesize labelCreateShoppingList;
@synthesize shoppingListTF;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createShoppingListButton:(id)sender {
    NSString * list = shoppingListTF.text;
    NSString* urlCreate = @"http://appspaces.fr/esgi/shopping_list/shopping_list/create.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?token=%@&name=%@", user.token, name];
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat: @"%@%@", urlCreate,urlData];
    
    //1. NSURL décrire l'url
    NSURL* URL = [NSURL URLWithString:urlString];
    
    //2. utilise la classe pour creer la requete
    NSURLRequest* request = [NSURLRequest requestWithURL:URL];
    
    //3. établir la connection
    NSURLConnection * connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (connection != nil)
        NSLog(@"OK");
    else
        NSLog(@"KO");
    
    if (!error) {
        if ([[jsonDict objectForKey:@"code"] isEqualToString:@"0"]) {
            NSLog(@"La liste de course a été créé avec succès.");
            ShoppingList* list = [ShoppingList new];
            [list setNameShoppingList:[[jsonDict objectForKey:@"result"] objectForKey:@"name"]];
        }
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"2"]){
            NSLog(@"La liste de course existe déja !");
        }
    }

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
