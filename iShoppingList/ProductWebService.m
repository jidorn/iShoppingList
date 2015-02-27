//
//  ProductWebServiceViewController.m
//  iShoppingList
//
//  Created by QUERE Alexandre on 27/02/2015.
//  Copyright (c) 2015 JD. All rights reserved.
//

#import "ProductWebService.h"

@interface ProductWebService ()

@end

@implementation ProductWebService

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(Product*)createProduct:(NSString *)tokenUser andIdShoppingList:(NSInteger *)IdShop andNameProduct:(NSString *)name andQuantity:(NSInteger *)quantity andPrice:(double)price{
    NSString* urlCreateProduct = @"";
    
    return nil;
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
