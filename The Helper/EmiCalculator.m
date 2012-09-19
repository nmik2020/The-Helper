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
@synthesize rate,loanterm,principalAmount,showLabel,calculate,slider;
@synthesize emi = _emi;
@synthesize interest = _interest;
@synthesize totalAmount = _totalAmount;

float monthlyrate;
float ratevalue;
int const numberOfMonths = 12;
int const one = 1;
int const percent_divisor = 1/100;
int const hundred = 100;
- (void)viewDidLoad
{
    [super viewDidLoad];
}
//When slider is moved, the corresponding change is seen in the text field
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *rateslider = (UISlider *) sender;
	int progressAsInt =(int)(rateslider.value + 0.5f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%d",progressAsInt];
	rate.text = newText; 
}  
//When text value is changed, the corresponding change is seen in the slider
- (IBAction) rateTextValueChanged:(UITextField *)sender {  
        [slider setValue:[rate.text floatValue] animated:YES];
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
    else if([rate.text floatValue]>hundred)
    {
        [self rateOutOfBoundsAlert];
    }
    else
    {
    
    [self calculateEmi];
    [self calculateInterest];
    [self calculateTotalAmount];
    }
}
-(void)rateOutOfBoundsAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:@"Alert"message:@"RATE CANT BE GREATER THAN 100" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];    
    [myAlert show];  
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
    monthlyrate = (ratevalue/numberOfMonths/100); //Converting the annual rate into monthly rate
   _emi = [principalAmount.text floatValue]*monthlyrate*pow((one+monthlyrate), [loanterm.text floatValue])/(pow((one+monthlyrate), [loanterm.text floatValue])-one);
    //the mathematical formula to obtain the emi
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
    self.slider = nil;
  
}


- (void)viewWillDisappear:(BOOL)animated 
{
    principalAmount.text = nil;
    rate.text = nil;
    loanterm.text = nil;
    slider.value = 0;
    
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
