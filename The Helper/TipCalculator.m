//
//  PrincipalSecondViewController.m
//  The Helper
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
int const Zero = 0;
float Percentage_divisor= 1/100;

- (void)viewDidLoad
{
    [super viewDidLoad];
}

-(IBAction)calculateTip:(id)sender{
    if ((![billAmount.text length]) || (![rate.text length]) ) 
    {   [self fieldEmptyAlert];  
    }else if(([billAmount.text floatValue])<Zero || ([rate.text floatValue]<Zero) ) 
    {
        [self negativeAlert]; 
        
    }
    else if([rate.text floatValue]>100)
    {
        [self rateOutOfBoundsAlert];
    }

    else{
    _tip = [rate.text floatValue]/100*[billAmount.text floatValue];
    }
}
- (IBAction) rateTextValueChanged:(UITextField *)sender {  
    [slider setValue:[rate.text floatValue] animated:YES];
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

- (void)viewWillDisappear:(BOOL)animated 
{
    billAmount.text = nil;
    rate.text = nil;
    slider.value = 0;
}
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *rateslider = (UISlider *) sender;
	int progressAsInt =(int)(rateslider.value + 0.5f);
	NSString *newText =[[NSString alloc] initWithFormat:@"%d",progressAsInt];
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
    if ([[segue identifier] isEqualToString:@"Result"])
    {
        TipDetailViewController *detailViewController = 
        segue.destinationViewController;
        detailViewController.tip = _tip;
    }
}   


@end
