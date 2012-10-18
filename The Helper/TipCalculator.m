//

//
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "TipCalculator.h"
#import "TipDetailViewController.h"
#import "Constants.h"
#import "tipInputValidator.h"
@implementation TipCalculator
@synthesize tip= _tip;
@synthesize billAmount,rate,calculate,slider,tipCanBeCalculated,billAmountLabel,rateLabel,rateIsDecimal;

double tipRate;
double totalBillValue;
tipInputValidator *tipAlert;
connectToTipServer *tipConnection;
XMLParser *parsexml;
- (void)viewDidLoad
{   billAmount.delegate = (id)self;
    rate.delegate = (id)self;
    rate.keyboardType = UIKeyboardTypeDecimalPad;
    [super viewDidLoad];
}

-(IBAction)calculateTip:(id)sender{
      NSError *error = NULL;
    billAmountLabel.text = @"";
    rateLabel.text = @"";
    tipCanBeCalculated=TRUE;
    if (!tipAlert) {
        tipAlert = [[tipInputValidator alloc]init];
    }
    NSRegularExpression *tipRegexString = [NSRegularExpression regularExpressionWithPattern:@"\\d" options:NSRegularExpressionSearch error:&error];
    NSUInteger billAmountCount = [tipRegexString  numberOfMatchesInString:billAmount.text
                                                                    options:0 range:NSMakeRange(0, [billAmount.text length])];
    NSUInteger tipRateCount = [tipRegexString  numberOfMatchesInString:rate.text
                                                                  options:0 range:NSMakeRange(0, [rate.text length])];
    
    
    [billAmount resignFirstResponder];
    [rate resignFirstResponder];
    [calculate resignFirstResponder];
    parsexml = [[XMLParser alloc]init];
    tipRate = [rate.text doubleValue];
    totalBillValue = [billAmount.text doubleValue];
    tipConnection = [[connectToTipServer alloc]init];
    tipConnection.delegate = (id)self;
   

    if(billAmountCount!=[billAmount.text length] || tipRateCount!=[rate.text length] )
    {
        
        if(billAmountCount!=[billAmount.text length])
        [tipAlert billAmountInvalidTypeAlert:self withCount:billAmountCount];
        if(tipRateCount!=[rate.text length] && tipRateCount!=([rate.text length]-1))
        [tipAlert tipRateInvalidTypeAlert:self withCount:tipRateCount];
        else if(tipRateCount == ([rate.text length]-1))
        {    rateIsDecimal=TRUE;
            tipCanBeCalculated=TRUE;
        }
        if (!rateIsDecimal) {
            tipCanBeCalculated = FALSE;
        }
        
        
    }
    if ((![billAmount.text length]) || (![rate.text length]) )
    {
        if(![billAmount.text length])
            [tipAlert billAmountFieldEmptyAlert:self];
        if(![rate.text length])
      [tipAlert tipRateFieldEmptyAlert:self];
               tipCanBeCalculated=FALSE;
    }
    
    if(([billAmount.text doubleValue])<0 || ([rate.text doubleValue]<0) )
    {
        [tipAlert tipNegativeAlert:self];
        tipCanBeCalculated=FALSE;
    }
    if([rate.text doubleValue]>100)
    {
        [tipAlert tipRateOutOfBoundsAlert:self];
        tipCanBeCalculated=FALSE;
        
    }
    if(tipCanBeCalculated)
    {   
        [tipConnection performRequest:tipRate andResponse:totalBillValue];
    }
   
}
- (IBAction) rateTextValueChanged:(UITextField *)sender {  
    [slider setValue:[rate.text floatValue] animated:YES];
}
- (void) tipCalculationDidFinish:(NSString *)xmlData
{
    
    parsexml.delegatew = self;
    [parsexml doParse:[xmlData dataUsingEncoding:NSUTF8StringEncoding]];
}
-(void)sendData:(NSString*)tip
{   _tip = [tip doubleValue];
    [self performSegueWithIdentifier:emiSegueIdentifier sender:self];

}
-(void)getValue:(NSString*)value{
   
    _tip = [value doubleValue];

}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{textField.backgroundColor = [UIColor whiteColor];
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.25];
    self.view.frame = CGRectMake(0,-20,320,400);
    [UIView commitAnimations];
    
}



- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *rateslider = (UISlider *) sender;
	float progressAsInt =(float)(rateslider.value + 0.0f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%0.02f",progressAsInt];
	rate.text = newText;
    if([rate.text doubleValue]>0)
    { rate.backgroundColor = [UIColor whiteColor];
        rateLabel.text = @"";
    }

} 
- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [rate resignFirstResponder];
    [billAmount resignFirstResponder];
}
- (void)viewDidUnload
{
    [super viewDidUnload];
    self.billAmount =nil;
    self.rate = nil;
    self.billAmount = nil;
}
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}
-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:segueIdentifier])
    {
        TipDetailViewController *detailViewController = 
        segue.destinationViewController;
        detailViewController.tip = _tip;
    }
}   


@end
