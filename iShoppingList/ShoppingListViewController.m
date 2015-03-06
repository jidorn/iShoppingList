//
//  ShoppingListViewController.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 03/03/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "ShoppingListViewController.h"
#import "CreateShoppingListViewController.h"

@interface ShoppingListViewController ()

@end

static NSString * const cellId = @"SuperUniqueKey";

@implementation ShoppingListViewController
@synthesize tableShoppingListView;
@synthesize user = _user;
@synthesize shoppingList;


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Shopping List";
    }
    return self;
    NSLog(@"token : %@", _user.token);
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    
    //1.
    NSString* urlShoppingList = @"http://appspaces.fr/esgi/shopping_list/shopping_list/list.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?token=%@", _user.token];
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat:@"%@%@",urlShoppingList, urlData];
    
    NSURL* url = [NSURL URLWithString:urlString];
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSError* error = nil;
    
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:0 error:&error];
    
    NSMutableDictionary * jsonDict = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    if (!error) {
        if ([[jsonDict objectForKey:@"code"] isEqualToString:@"0"]) {
            
            NSMutableArray *shoppingListObject = [jsonDict objectForKey:@"result"];
            NSDictionary *indexList = [shoppingListObject objectAtIndex:cellId];
            
            NSLog(@"result : %@", jsonDict);
            /*
            NSInteger n = [[indexList objectForKey:@"id"] intValue];
            shoppingList = [ShoppingList new];
            [shoppingList setIdShoppingList:<#(NSInteger *)#>]
            cell.textLabel.text =
             
             */
        }
    }
    
    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableShoppingListView.delegate = self;
    self.tableShoppingListView.dataSource = self;
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)createButton:(id)sender {
    NSLog(@"token : %@", _user.token);
    CreateShoppingListViewController *createShoppingList = [CreateShoppingListViewController new];
    [self.navigationController pushViewController:createShoppingList animated:YES];
    createShoppingList.user=_user;
}

@end