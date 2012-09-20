//

//
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "TipCalculator.h"
#import "TipDetailViewController.h"



@implementation TipCalculator
@synthesize tip= _tip;
@synthesize billAmount,rate,calculate,slider;
int const Zero = 0;//used to check if length of text field's are empty or not 
NSString *negativeMessage = @"VALUES are NEGATIVE";
NSString *outOfBoundMessage = @"RATE CANT BE GREATER THAN 100";
NSString *fieldEmptyMessage = @"VALUES NOT ENTERED";
NSString *alertButton = @"Alert";
NSString *segueIdentifier = @"Result";
NSString *okayButton = @"Okay";


- (void)viewDidLoad
{   rate.keyboardType = UIKeyboardTypeDecimalPad;
    [super viewDidLoad];
}

-(IBAction)calculateTip:(id)sender{
    if ((![billAmount.text length]) || (![rate.text length]) ) 
       [self fieldEmptyAlert];  
    else if(([billAmount.text floatValue])<Zero || ([rate.text floatValue]<Zero) ) 
        [self negativeAlert]; 
    else if([rate.text floatValue]>100) //to generate alert if rate goes beyond 100
            [self rateOutOfBoundsAlert];
    else{
    [self tipValue];
    [self performSegueWithIdentifier:segueIdentifier sender:self];
    }
}
- (IBAction) rateTextValueChanged:(UITextField *)sender {  
    [slider setValue:[rate.text floatValue] animated:YES];
}
-(float)tipValue
{
    _tip = [rate.text floatValue]/100*[billAmount.text floatValue];
    return _tip;
}
-(void)rateOutOfBoundsAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:alertButton message:outOfBoundMessage delegate:nil cancelButtonTitle:okayButton otherButtonTitles: nil];    
    [myAlert show];  
}


-(void)negativeAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:alertButton message:negativeMessage delegate:nil cancelButtonTitle:okayButton otherButtonTitles: nil];    
    [myAlert show];  
}

-(void)fieldEmptyAlert
{
    UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:alertButton message:fieldEmptyMessage delegate:nil cancelButtonTitle:okayButton otherButtonTitles: nil];    
    [myAlert show];
}

- (void)viewWillDisappear:(BOOL)animated 
{
    billAmount.text = nil;
    rate.text = nil;
    slider.value = 0;
}
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *rateslider = (UISlider *) sender;
	float progressAsInt =(float)(rateslider.value + 0.0f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%0.02f",progressAsInt];
	rate.text = newText; 
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
