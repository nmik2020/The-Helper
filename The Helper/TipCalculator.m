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
@synthesize billAmount,rate,calculate;
- (void)viewDidLoad
{
    [super viewDidLoad];

}
-(IBAction)calculateTip:(id)sender{
    if ((![billAmount.text length]) || (![rate.text length]) ) 
    {   [self fieldEmptyAlert];  
    }else if(([billAmount.text floatValue])<0 || ([rate.text floatValue]<0) ) 
    {
        [self negativeAlert]; 
        
    }

    else{

    _tip = [rate.text floatValue]/100*[billAmount.text floatValue];
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

- (void)viewWillDisappear:(BOOL)animated 
{
    billAmount.text = nil;
    rate.text = nil;
    
    
}
- (IBAction) sliderValueChanged:(UISlider *)sender {  
  	UISlider *slider = (UISlider *) sender;
	int progressAsInt =(int)(slider.value + 0.5f);
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
