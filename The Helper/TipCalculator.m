//

//
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "TipCalculator.h"
#import "TipDetailViewController.h"
#import "coreCalculations.h"
#import "Constants.h"
#import "Exceptions.h"

@implementation TipCalculator
@synthesize tip= _tip;
@synthesize billAmount,rate,calculate,slider,tipCanBeCalculated,billAmountLabel,rateLabel;

double tipRate;
double totalBillValue;
coreCalculations *calculator;
Exceptions *tipAlert;
- (void)viewDidLoad
{

    rate.keyboardType = UIKeyboardTypeDecimalPad;
    [super viewDidLoad];
}

-(IBAction)calculateTip:(id)sender{
    calculator = [[coreCalculations alloc]init];
    
    NSError *error = NULL;
    billAmountLabel.text = @"";
    rateLabel.text = @"";
    
    tipCanBeCalculated=TRUE;
    
    if (!tipAlert) {
        tipAlert = [[Exceptions alloc]init];
    }
    NSRegularExpression *tipRegexString = [NSRegularExpression regularExpressionWithPattern:@"[0-9.]" options:NSRegularExpressionSearch error:&error];
    NSUInteger billAmountCount = [tipRegexString  numberOfMatchesInString:billAmount.text
                                                                    options:0 range:NSMakeRange(0, [billAmount.text length])];
    NSUInteger tipRateCount = [tipRegexString  numberOfMatchesInString:rate.text
                                                                  options:0 range:NSMakeRange(0, [rate.text length])];
    
    
    
    
    [billAmount resignFirstResponder];
    [rate resignFirstResponder];
    [calculate resignFirstResponder];
    
    calculator = [[coreCalculations alloc]init];
    tipRate = [rate.text doubleValue];
    totalBillValue = [billAmount.text doubleValue];
    
    if(billAmountCount!=[billAmount.text length] || tipRateCount!=[rate.text length] )
    {
        
        if(billAmountCount!=[billAmount.text length])
            [tipAlert billAmountInvalidTypeAlert:self withCount:billAmountCount];
        
        if(tipRateCount!=[rate.text length])
            [tipAlert tipRateInvalidTypeAlert:self withCount:billAmountCount];
                
        tipCanBeCalculated = FALSE;
    }
    if ((![billAmount.text length]) ||(![rate.text length]) )    {
        if(![billAmount.text length])
            [tipAlert tipFieldEmptyAlert:self];
        if(![rate.text length])
      [tipAlert tipFieldEmptyAlert:self];
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
        tipRate =  [rate.text floatValue];
        totalBillValue = [billAmount.text floatValue];
        _tip=[calculator tipValue:tipRate ofAmount:totalBillValue];
    [self performSegueWithIdentifier:segueIdentifier sender:self];
    }
   
}
- (IBAction) rateTextValueChanged:(UITextField *)sender {  
    [slider setValue:[rate.text floatValue] animated:YES];
}



- (void)viewWillDisappear:(BOOL)animated 
{
    //billAmount.text = nil;
    //rate.text = nil;
    //slider.value = 0;
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
