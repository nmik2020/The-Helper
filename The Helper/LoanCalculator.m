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
@synthesize emi = _emi;
@synthesize interest = _interest;
@synthesize totalAmount = _totalAmount;
@synthesize mySlider;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    

}
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *slider = (UISlider *) sender;
	int progressAsInt =(int)(slider.value + 0.5f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%d",progressAsInt];
	rate.text = newText; 
}  
- (IBAction)calculateLoan:(id)sender
{
//     _emi = [principalAmount.text doubleValue]*[rate.text doubleValue]*pow((1+[rate.text doubleValue]), [loanterm.text doubleValue])/(pow((1+[rate.text doubleValue]), [loanterm.text doubleValue])-1);
    [self calculateEmi];
    [self calculateInterest];
    [self calculateTotalAmount];
    NSLog(@"emi %f",_emi);
    NSLog(@"Interest %f",_interest);
    NSLog(@"Total Amount %f",_totalAmount);
    //[principalAmount resignFirstResponder];
    //[rate resignFirstResponder];
    //[loanterm resignFirstResponder];
}
- (double)calculateEmi
{
   _emi = [principalAmount.text doubleValue]*[rate.text doubleValue]*pow((1+[rate.text doubleValue]), [loanterm.text doubleValue])/(pow((1+[rate.text doubleValue]), [loanterm.text doubleValue])-1);
    return _emi;
}
- (double)calculateInterest{
    _interest = [principalAmount.text doubleValue]*[rate.text doubleValue]*[loanterm.text doubleValue]/100;
    return _interest;
}
- (double)calculateTotalAmount{
    _totalAmount = [principalAmount.text doubleValue] + _interest;
    return _totalAmount;
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
        detailViewController.emi = _emi;
        detailViewController.interest = _interest;
        detailViewController.totalamount = _totalAmount;

     
    }
}   


@end
