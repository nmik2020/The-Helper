//
//  LoanDetailViewController.m
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoanDetailViewController.h"

@implementation LoanDetailViewController
@synthesize loanamt;
@synthesize result=_result;
@synthesize s;
- (void)viewDidLoad
{
    
    [super viewDidLoad];
    	// Do any additional setup after loading the view.
    self.result.text = self.s;
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
