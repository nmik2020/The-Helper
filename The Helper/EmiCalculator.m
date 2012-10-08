
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "EmiDetailViewController.h"
#import "coreCalculations.h"
#import "Exceptions.h"
#import "Constants.h"
@interface EmiCalculator ()

@end

@implementation EmiCalculator
@synthesize rate,loanterm,principalAmount,showLabel,calculate,slider,principalAmountErrorLabel,rateErrorLabel,loantermErrorLabel,canCalculate;
@synthesize emi = _emi;
@synthesize interest = _interest;
@synthesize totalAmount = _totalAmount;

double monthlyrate;
double ratevalue;
double amount;
double period;
Exceptions *alert;

coreCalculations *Calculator;
- (void)viewDidLoad
{       // self.view.backgroundColor = [[UIColor alloc] initWithPatternImage:[UIImage imageNamed:@"bag_of_money.png"]];
    principalAmount.delegate = self;
    rate.delegate = self;
    loanterm.delegate = self;
    principalAmount.keyboardType = UIKeyboardTypeDecimalPad;
    rate.keyboardType = UIKeyboardTypeDecimalPad;
        [super viewDidLoad];
     

   
}
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *rateslider = (UISlider *) sender;
	float progressAsInt =(float)(rateslider.value + 0.0f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%0.02f",progressAsInt];
	rate.text = newText;
    if([rate.text doubleValue]>0)
    { rate.backgroundColor = [UIColor whiteColor];
        rateErrorLabel.text = @"";
    }
}
- (IBAction) rateTextValueChanged:(UITextField *)sender {
        [slider setValue:[rate.text doubleValue] animated:YES];
     }

- (IBAction)calculateEmi:(id)sender
{   NSError *error = NULL;
    loantermErrorLabel.text = @"";
    principalAmountErrorLabel.text = @"";
    rateErrorLabel.text = @"";
    canCalculate=TRUE;

    if (!alert) {
        alert = [[Exceptions alloc]init];
    }
    NSRegularExpression *regexString = [NSRegularExpression regularExpressionWithPattern:@"[0-9.]" options:NSRegularExpressionSearch error:&error];
    NSUInteger principalAmountCount = [regexString  numberOfMatchesInString:principalAmount.text
                                                     options:0 range:NSMakeRange(0, [principalAmount.text length])];
    NSUInteger rateCount = [regexString  numberOfMatchesInString:rate.text
                                                                    options:0 range:NSMakeRange(0, [rate.text length])];
    NSUInteger loantermCount = [regexString  numberOfMatchesInString:loanterm.text
                                                                    options:0 range:NSMakeRange(0, [loanterm.text length])];
   
        
    
    [principalAmount resignFirstResponder];
    [rate resignFirstResponder];
    [loanterm resignFirstResponder];
    [calculate resignFirstResponder];
    
    Calculator = [[coreCalculations alloc]init];
    ratevalue = [rate.text doubleValue];
    amount = [principalAmount.text doubleValue];
    period =[loanterm.text doubleValue];
    
    if(principalAmountCount!=[principalAmount.text length] || rateCount!=[rate.text length] || loantermCount!=[loanterm.text length])
    {
        
        if(principalAmountCount!=[principalAmount.text length])
        [alert principalAmountInvalidTypeAlert:self withCount:principalAmountCount];
             
       if(rateCount!=[rate.text length])
            [alert rateInvalidTypeAlert:self withCount:rateCount];
        if(loantermCount!=[loanterm.text length])
            [alert loantermInvalidTypeAlert:self withCount:loantermCount];
        
        canCalculate = FALSE;
    }
    if ((![loanterm.text length]) ||(![rate.text length]) || ![principalAmount.text length] )    {
        if(![principalAmount.text length])
            [alert principalAmountFieldEmptyAlert:self];
         if(![rate.text length])
             [alert rateFieldEmptyAlert:self];
        if(![loanterm.text length])
            [alert loantermFieldEmptyAlert:self];
        canCalculate=FALSE;

   }
    
    if(([loanterm.text doubleValue])<0 || ([rate.text doubleValue]<0) || [principalAmount.text doubleValue]<0)
    {
        [alert negativeAlert:self];
        canCalculate=FALSE;
    }
    if([rate.text doubleValue]>100)
    {
       [alert rateOutOfBoundsAlert:self];
        canCalculate=FALSE;
        
    }
    if(canCalculate)
    {   
        _emi = [Calculator calculateEmi:ratevalue perMonth:amount ofLoan:period];
        _interest= [Calculator calculateInterest:_emi of:period Loan:amount];
        _totalAmount=[Calculator calculateTotalAmount:amount paid:_interest];
    [self performSegueWithIdentifier:emiSegueIdentifier sender:self];

    }
}



- (void)textFieldDidBeginEditing:(UITextField *)textField
{textField.backgroundColor = [UIColor whiteColor];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,-20,320,400);
    [UIView commitAnimations];
    
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
