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
    NSString *myNewString = [NSString stringWithFormat:@"%f", self.emi];
    NSString *myNewString2 = [NSString stringWithFormat:@"%f", self.interest];
    NSString *myNewString3 = [NSString stringWithFormat:@"%f", self.totalamount];

    // Do any additional setup after loading the view.
    self.monthlypayment.text = myNewString;
    self.simpleinterest.text = myNewString2;
    self.totalpayment.text = myNewString3;

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
