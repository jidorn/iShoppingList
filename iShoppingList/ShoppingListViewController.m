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
@synthesize shoppingListArray;
@synthesize index;
@synthesize receiveData;
@synthesize jsonDict;


-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Shopping List";
    }
    return self;
    NSLog(@"token : %@", _user.token);
}

-(void)setupPlacesFromJSONDict:(NSData*)tableListData{
    NSError *error;
    shoppingListArray = [NSMutableArray new];
    jsonDict = [NSJSONSerialization JSONObjectWithData:tableListData options:0 error:&error];
    if(error){
        NSLog(@"error parsing the json data from server with error description - %@", [error localizedDescription]);
    }
    else {
        NSDictionary* objectList = [jsonDict objectForKey:@"result"];
        for (shoppingList in objectList) {
            ShoppingList* oneShoppingList = [ShoppingList new];
            [shoppingListArray addObject:oneShoppingList];
        }
    }
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [shoppingListArray count];
}


- (IBAction)updateButton:(id)sender {
    
    NSString* urlShoppingList = @"http://appspaces.fr/esgi/shopping_list/shopping_list/list.php";
    
    NSString* urlData = [NSString stringWithFormat:@"?token=%@", _user.token];
    
    NSMutableString* urlString = [[NSMutableString alloc] initWithFormat:@"%@%@",urlShoppingList, urlData];
    
    NSURL* url = [NSURL URLWithString:urlString];
    
    NSURLRequest* request = [NSURLRequest requestWithURL:url];
    
    NSError* error = nil;
    
    receiveData = [NSURLConnection sendSynchronousRequest:request returningResponse:0 error:&error];
    
    [self setupPlacesFromJSONDict:receiveData];
    
    }

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (!cell)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    if ([shoppingListArray count]==0) {
        cell.textLabel.text = @"No shopping list has been added";
    }
    else{
            ShoppingList *shoppingListCurrentPlace = [shoppingListArray objectAtIndex:indexPath.row];
            cell.textLabel.text = [shoppingListCurrentPlace nameShoppingList];
            NSLog(@"shopping list name : %@", shoppingListCurrentPlace);
        
    }
    
    return cell;
    NSLog(@"cell : %@", cell);
    
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