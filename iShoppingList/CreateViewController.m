//
//  CreateViewController.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "CreateViewController.h"
#import "HomeViewController.h"
#import "User.h"

@interface CreateViewController ()

@end

@implementation CreateViewController

@synthesize mailTF;
@synthesize nameTF;
@synthesize firstNameTF;
@synthesize passwordTF;
@synthesize labelResponse;

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Register";
    }
    return self;
}

- (IBAction)createUser:(id)sender {
    NSString * mail = mailTF.text;
    NSString * name = nameTF.text;
    NSString * firstName = firstNameTF.text;
    NSString * password = passwordTF.text;
    
    
    NSString* urlSubscribe = @"http://appspaces.fr/esgi/shopping_list/account/subscribe.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?email=%@&password=%@&firstname=%@&lastname=%@", mail, password, firstName, name];
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat:@"%@%@", urlSubscribe, urlData];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSError* error = nil;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (!error)
    {
        
        if ([[jsonDict objectForKey:@"code"] isEqualToString:@"0"])
        {
            
            NSLog(@"La session a été crée avec succès.");
            labelResponse.text = @"La session a été crée avec succès.";
            
            User* user = [User new];
            [user setToken:[[jsonDict objectForKey:@"result"] objectForKey:@"token"]];
            [user setLastName:[[jsonDict objectForKey:@"result"] objectForKey:@"lastname"]];
            [user setEmail:[[jsonDict objectForKey:@"result"] objectForKey:@"email"]];
            [user setFirstName:[[jsonDict objectForKey:@"result"] objectForKey:@"firstname"]];
            NSLog(@"name : %@", [user lastName]);
        }
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"2"])
        {
            NSLog(@"Le compte existe déja.");
            
            labelResponse.text = @"Le compte existe déja.";
        }
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"1"])
            labelResponse.text = @"des parametres sont manquants";
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"5"])
            labelResponse.text = @"Oups, ceci est embarassant. Il semblerait que notre serveur ait quelques problemes";
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"6"])
            labelResponse.text = @"action non autorisé";
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
