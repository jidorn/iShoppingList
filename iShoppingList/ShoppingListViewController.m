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

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    if (cell == nil)
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    cell.textLabel.text = [NSString stringWithFormat:@"%lu", indexPath.row];
    return cell;
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([[segue identifier] isEqualToString:@"user"]) {
        CreateShoppingListViewController *createShoppingListViewController = [segue destinationViewController];
        [createShoppingListViewController setUser:_user];
    }
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
