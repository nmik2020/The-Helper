//
//  LoanDetailViewController.m
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "EmiDetailViewController.h"

@implementation EmiDetailViewController
@synthesize monthlypayment,simpleinterest,totalpayment;
@synthesize emi;
@synthesize interest;
@synthesize totalamount;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSString *payment = [NSString stringWithFormat:@"%0.02f", self.emi];
    NSString *simple = [NSString stringWithFormat:@"%0.02f", self.interest];
    NSString *total = [NSString stringWithFormat:@"%0.02f", self.totalamount];
    
    monthlypayment.text = payment;
    simpleinterest.text = simple;
    totalpayment.text = total;

}
- (void)viewWillDisappear:(BOOL)animated 
{
    monthlypayment.text = nil;
    simpleinterest.text = nil;
    totalpayment.text = nil;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
