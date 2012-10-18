
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "EmiDetailViewController.h"
#import "Constants.h"
#import "connectToEmiServer.h"
#import "emiInputValidator.h"
#import "EmiCalculator.h"

@implementation EmiCalculator
@synthesize rate,loanterm,principalAmount,slider,principalAmountErrorLabel,rateErrorLabel,loantermErrorLabel,canCalculate,gotDecimal;
@synthesize emi = _emi;
@synthesize interest = _interest;
@synthesize totalAmount = _totalAmount;

double ratevalue;
double amount;
double period;
emiInputValidator *alert;
connectToEmiServer *connection;
- (void)viewDidLoad
{   
    principalAmount.delegate = (id)self;
    rate.delegate = (id)self;
    loanterm.delegate = (id)self;
    principalAmount.keyboardType = UIKeyboardTypeDecimalPad;
    rate.keyboardType = UIKeyboardTypeDecimalPad;

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
{
    loantermErrorLabel.text = @"";
    principalAmountErrorLabel.text = @"";
    rateErrorLabel.text = @"";
    canCalculate=TRUE;
    connection = [[connectToEmiServer alloc]init];
    connection.delegate = (id)self;
    if (!alert) {
        alert = [[emiInputValidator alloc]init];
    }
    amount = [principalAmount.text doubleValue];
    ratevalue = [rate.text doubleValue];
    period = [loanterm.text doubleValue];
    


    [principalAmount resignFirstResponder];
    [rate resignFirstResponder];
    [loanterm resignFirstResponder];
    [calculate resignFirstResponder];
    

    [alert checkForErrors:principalAmount inAll:rate Inputs:loanterm andSend:self];
    if(canCalculate)
    {  
        [connection performRequest:amount andFetch:period Response:ratevalue];

    }
}
- (void) calculationDidFinish:(NSMutableDictionary *)dictionary {
    _emi=[[dictionary valueForKey:@"emi"]doubleValue];
    _interest=[[dictionary valueForKey:@"rate"]doubleValue];
    _totalAmount=[[dictionary valueForKey:@"totalamount"]doubleValue];
   
   [self performSegueWithIdentifier:emiSegueIdentifier sender:self];
}
-(void)serverDownError
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:
                          @"Server is Down"
                                                    message:
                          @"Please wait"
                          delegate
                                                           : self cancelButtonTitle:
                          @"Close"
                                          otherButtonTitles: nil];
    
    
    [alert show];

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
    return YES;
    
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
