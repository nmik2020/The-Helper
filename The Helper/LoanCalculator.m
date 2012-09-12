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
float monthlyrate;
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
     
    [self calculateEmi];
    [self calculateInterest];
    [self calculateTotalAmount];

   
}
- (float)calculateEmi
{   monthlyrate = ([rate.text floatValue]/12/100);
   _emi = [principalAmount.text floatValue]*monthlyrate*pow((1+monthlyrate), [loanterm.text floatValue])/(pow((1+monthlyrate), [loanterm.text floatValue])-1);
    return _emi;
}
- (float)calculateInterest{
    _interest = ((_emi*[loanterm.text floatValue]) - [principalAmount.text floatValue]);
    return _interest;
}
- (float)calculateTotalAmount{
    _totalAmount = [principalAmount.text floatValue] + _interest;
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
