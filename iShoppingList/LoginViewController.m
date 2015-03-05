//
//  LoginViewController.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "LoginViewController.h"
#import "HomeViewController.h"
#import "ShoppingListViewController.h"

@interface LoginViewController ()

@end

@implementation LoginViewController
@synthesize mailTF;
@synthesize passTF;
@synthesize labelLogin;
@synthesize user;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Login";
    }
    return self;
}

- (IBAction)logButton:(id)sender {
    NSString * mail = mailTF.text;
    NSString * pass = passTF.text;
    
    NSString* urlLogin = @"http://appspaces.fr/esgi/shopping_list/account/login.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?email=%@&password=%@", mail, pass];
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat:@"%@%@", urlLogin, urlData];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSError* error = nil;
    
    
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:0 error:&error];
    
    
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (!error)
    {
        if ([[jsonDict objectForKey:@"code"] isEqualToString:@"0"])
        {
            
            NSLog(@"Vous etes enregistré");
            
            user =[User new];
            [user setToken:[[jsonDict objectForKey:@"result"] objectForKey:@"token"]];
            [user setFirstName:[[jsonDict objectForKey:@"result"] objectForKey:@"firstname"]];
            [user setLastName:[[jsonDict objectForKey:@"result"] objectForKey:@"lastname"]];
            [user setEmail:[[jsonDict objectForKey:@"result"] objectForKey:@"email"]];
            NSLog(@"name : %@",[user lastName]);
            NSLog(@"token %@", [user token]);
            
            ShoppingListViewController * shoppingListViewController = [ShoppingListViewController new];
            [self.navigationController pushViewController:shoppingListViewController animated:YES];
            shoppingListViewController.user = user;
        }
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"1"])
        {
            
            NSLog(@"Veuillez saisir tous les champs !");
            labelLogin.text = @"Veuillez saisir tous les champs !";
            
        }
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"3"]){
             NSLog(@"Connexion échoué. vérifiez votre login ou mot de passe.");
            labelLogin.text = @"Connexion échoué. vérifiez votre login ou mot de passe.";
        }
        
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"4"]){
            NSLog(@"Oups, c'est embarassant. Nous n'avons pas pu vous identifier");
            labelLogin.text = @"Oups, c'est embarrassant. Nous n'avons pas pu vous identifier";
        }
        
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"5"]){
            NSLog(@"Oups, c'est embarrassant. Notre serveur connait quelques dysfonctionnement");
            labelLogin.text = @"Oups, c'est embarassant. Notre serveur connait quelques dysfonctionnement";
        }
        
    }

}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"user"]) {
        ShoppingListViewController * shoppingListViewController = [segue destinationViewController];
        [shoppingListViewController setUser:user];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
