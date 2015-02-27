//
//  FunctionUser.m
//  iShoppingList
//
//  Created by Etudiant on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "FunctionUser.h"
#import "User.h"
@interface FunctionUser ()

@end

@implementation FunctionUser

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+ (User*) subscribeWithUser: (User*) user andPassword: (NSString*) password{
    
    NSString* urlSubscribe = @"http://appspaces.fr/esgi/shopping_list/account/subscribe.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?email=%@&password=%@&firstname=%@&lastname=%@", [user email], password, [user firstName], [user lastName]];
    
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
            
            [user setToken:[[jsonDict objectForKey:@"result"] objectForKey:@"token"]];
            
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
