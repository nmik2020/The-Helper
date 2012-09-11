//
//  PrincipalFirstViewController.m
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "LoanCalculator.h"
#import "LoanDetailViewController.h"

@interface LoanCalculator ()

@end

@implementation LoanCalculator
@synthesize rate,loanterm,principalAmount,showLabel,calculate;
@synthesize results=_results;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (void)calculateLoan:(id)sender
{
    double emi = [principalAmount.text doubleValue]*[rate.text doubleValue]*pow((1+[rate.text doubleValue]), [loanterm.text doubleValue])/(pow((1+[rate.text doubleValue]), [loanterm.text doubleValue])-1);

    NSLog(@"emi %f",emi);
    [_results objectAtIndex:emi];
    [principalAmount resignFirstResponder];
    [rate resignFirstResponder];
    [loanterm resignFirstResponder];
}
- (IBAction)backgroundTouchedHideKeyboard:(id)sender  
{  
    [principalAmount resignFirstResponder];
    [rate resignFirstResponder];
    [loanterm resignFirstResponder]; 
    [calculate resignFirstResponder];
} 

- (void)viewDidUnload
{
    [super viewDidUnload];
    self.principalAmount = nil;
    self.rate = nil;
    self.loanterm = nil;
    // Release any retained subviews of the main view.
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"Result"])
    {
        LoanDetailViewController *detailViewController = 
        segue.destinationViewController;
        detailViewController.s = @"fghfg";
        
       // NSIndexPath *myIndexPath = [self.showLabel 
                                   // text];
    }
}   


@end
