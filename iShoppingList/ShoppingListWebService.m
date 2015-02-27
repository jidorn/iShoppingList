//
//  ShoppingListWebService.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "ShoppingListWebService.h"

@interface ShoppingListWebService ()

@end

@implementation ShoppingListWebService

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(ShoppingList*)createShoppingListWithToken:(NSString *)tokenUser andShopphingListName:(NSString *)name{
    NSString* urlCreate = @"http://appspaces.fr/esgi/shopping_list/shopping_list/create.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?token=%@&name=%@", tokenUser, name];
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat: @"%@%@", urlCreate,urlData];
    
    NSURL* URL = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:URL];
    NSError* error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
    NSMutableDictionary* jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if (!error) {
        if ([[jsonDict objectForKey:@"code"] isEqualToString:@"0"]) {
            NSLog(@"La liste de course a été créé avec succès.");
            ShoppingList* list = [ShoppingList new];
            [list setNameShoppingList:]
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
