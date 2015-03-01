//
//  FunctionUser.m
//  iShoppingList
//
//  Created by Etudiant on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "UserWebService.h"
#import "User.h"


@interface UserWebService ()

@end

@implementation UserWebService

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (User*) subscribeWithEmail: (NSString*) email andLastName: (NSString*) lastName andFirstName: (NSString*)firstName andPassword: (NSString*) password{
    
    NSString* urlSubscribe = @"http://appspaces.fr/esgi/shopping_list/account/subscribe.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?email=%@&password=%@&firstname=%@&lastname=%@", email, password, firstName, lastName];
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat:@"%@%@", urlSubscribe, urlData];
    
    NSURL* URL = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:URL];
    
    NSError* error = nil;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (!error)
    {
        
        if ([[jsonDict objectForKey:@"code"] isEqualToString:@"0"])
        {
            
            NSLog(@"La session a été crée avec succès.");
            
            User* user = [User new];
            [user setToken:[[jsonDict objectForKey:@"result"] objectForKey:@"token"]];
            [user setLastName:[[jsonDict objectForKey:@"result"] objectForKey:@"lastName"]];
            [user setEmail:[[jsonDict objectForKey:@"result"] objectForKey:@"email"]];
            [user setFirstName:[[jsonDict objectForKey:@"result"] objectForKey:@"firstName"]];
            return user;
            
        }
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"2"])
        {
            
            NSLog(@"Le compte existe déja.");
            
        }
        
    }
    
    return nil;
    
}

+ (User*) loginWithEmail: (NSString*) email andPassword: (NSString*) password{
    
    NSString* urlSubscribe = @"http://appspaces.fr/esgi/shopping_list/account/subscribe.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?email=%@&password=%@", email, password]; 
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat:@"%@%@", urlSubscribe, urlData];
    
    NSURL* URL = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:URL];
    
    NSError* error = nil;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    
    
    NSMutableDictionary *jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (!error)
    {
        
        if ([[jsonDict objectForKey:@"code"] isEqualToString:@"0"])
        {
            
            NSLog(@"La session a été crée avec succès.");
            
            User* user = [User new];
            [user setToken:[[jsonDict objectForKey:@"result"] objectForKey:@"token"]];
            [user setLastName:[[jsonDict objectForKey:@"result"] objectForKey:@"lastName"]];
            [user setEmail:[[jsonDict objectForKey:@"result"] objectForKey:@"email"]];
            [user setFirstName:[[jsonDict objectForKey:@"result"] objectForKey:@"firstName"]];

            return user;
            
        }
        else if ([[jsonDict objectForKey:@"code"] isEqualToString:@"2"])
        {
            
            NSLog(@"Le compte existe déja.");
            
        }
        
    }
    
    return nil;
    
}

@end
