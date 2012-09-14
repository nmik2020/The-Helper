//
//  PrincipalFirstViewController.m
//  The Helper
//
//
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
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
float ratevalue;
- (void)viewDidLoad
{
    [super viewDidLoad];

}
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *slider = (UISlider *) sender;
	int progressAsInt =(int)(slider.value + 0.5f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%d",progressAsInt];
	rate.text = newText; 
}  
- (IBAction)calculateLoan:(id)sender
{
    if ((![loanterm.text length]) || (![rate.text length]) ||(![principalAmount.text length])) 
    {        
    [self fieldEmptyAlert];
    }
    else if(([loanTerm.text floatValue])<0 || ([rate.text floatValue]<0) || [principalAmount.text floatValue]<0) 
    {
    [self negativeAlert];
    }
    else
    {
        
    [self calculateEmi];
    [self calculateInterest];
    [self calculateTotalAmount];
    }

   
}
-(void)negativeAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:@"Alert"message:@"VALUES are NEGATIVE" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];    
    [myAlert show];  
}
-(void)fieldEmptyAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:@"Alert"message:@"VALUES NOT ENTERED" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];    
    [myAlert show];
}
- (float)calculateEmi
{   ratevalue = [rate.text floatValue];
    if (ratevalue<0) {
        ratevalue =0;
    }
    monthlyrate = (ratevalue/12/100);
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
  
}


- (void)viewWillDisappear:(BOOL)animated 
{
    principalAmount.text = nil;
    rate.text = nil;
    loanterm.text = nil;
    
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
