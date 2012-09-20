
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "EmiCalculator.h"
#import "EmiDetailViewController.h"

@interface EmiCalculator ()

@end

@implementation EmiCalculator
@synthesize rate,loanterm,principalAmount,showLabel,calculate,slider,monthsToYears;
@synthesize emi = _emi;
@synthesize interest = _interest;
@synthesize totalAmount = _totalAmount;

float monthlyrate;
float ratevalue;
int const numberOfMonths = 12;
int const one = 1;
int const hundred = 100;

NSString *emiNegativeMessage = @"VALUES are NEGATIVE";
NSString *emiOutOfBoundMessage = @"RATE CANT BE GREATER THAN 100";
NSString *emiFieldEmptyMessage = @"VALUES NOT ENTERED";
NSString *emiAlertButton = @"Alert";
NSString *emiSegueIdentifier = @"Result";
NSString *emiOkayButton = @"Okay";
- (void)viewDidLoad
{   rate.keyboardType = UIKeyboardTypeDecimalPad;
    [super viewDidLoad];
     

   
}
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *rateslider = (UISlider *) sender;
	float progressAsInt =(float)(rateslider.value + 0.0f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%0.02f",progressAsInt];
	rate.text = newText; 
}  
- (IBAction) rateTextValueChanged:(UITextField *)sender {  
        [slider setValue:[rate.text floatValue] animated:YES];
     }

- (IBAction)calculateEmi:(id)sender
{
    if ((![loanterm.text length]) || (![rate.text length]) ||(![principalAmount.text length])) 
    {        
    [self fieldEmptyAlert];
    }
    else if(([loanterm.text floatValue])<0 || ([rate.text floatValue]<0) || [principalAmount.text floatValue]<0) 
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
    [self performSegueWithIdentifier:emiSegueIdentifier sender:self];

    }
}

-(void)rateOutOfBoundsAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:emiAlertButton message:emiOutOfBoundMessage delegate:nil cancelButtonTitle:emiOkayButton otherButtonTitles: nil];    
    [myAlert show];  
}

-(void)negativeAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:emiAlertButton message:emiNegativeMessage delegate:nil cancelButtonTitle:emiOkayButton otherButtonTitles: nil];    
    [myAlert show];  
}
-(void)fieldEmptyAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:emiAlertButton message:emiFieldEmptyMessage delegate:nil cancelButtonTitle:emiOkayButton otherButtonTitles: nil];    
    [myAlert show];
}
- (float)calculateEmi
{   ratevalue = [rate.text floatValue];
    monthlyrate = (ratevalue/numberOfMonths/hundred); //Converting the annual rate into monthly rate
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
{       if ([[segue identifier] isEqualToString:emiSegueIdentifier])
    {
        EmiDetailViewController *detailViewController = 
        segue.destinationViewController;
        detailViewController.emi = _emi;
        detailViewController.interest = _interest;
        detailViewController.totalamount = _totalAmount;

     
    }
   

}   


@end
