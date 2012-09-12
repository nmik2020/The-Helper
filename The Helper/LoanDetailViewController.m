//
//  LoanDetailViewController.m
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoanDetailViewController.h"

@implementation LoanDetailViewController
@synthesize monthlypayment=_monthlypayment;
@synthesize simpleinterest=_simpleinterest;
@synthesize totalpayment=_totalpayment;
@synthesize emi;
@synthesize interest;
@synthesize totalamount;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    NSString *payment = [NSString stringWithFormat:@"%0.02f", self.emi];
    NSString *simple = [NSString stringWithFormat:@"%0.02f", self.interest];
    NSString *total = [NSString stringWithFormat:@"%0.02f", self.totalamount];

    // Do any additional setup after loading the view.
    self.monthlypayment.text = payment;
    self.simpleinterest.text = simple;
    self.totalpayment.text = total;

}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
