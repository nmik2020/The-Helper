//
//  PrincipalSecondViewController.m
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "TipCalculator.h"
#import "TipDetailViewController.h"



@implementation TipCalculator
@synthesize tip= _tip;
@synthesize billAmount,rate,calculate;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
-(IBAction)calculateTip:(id)sender{
    if ((![billAmount.text length]) || (![rate.text length]) ) 
    {
        
        UIAlertView *myAlert = [[UIAlertView  alloc]initWithTitle:@"Alert"message:@"VALUES NOT ENTERED" delegate:nil cancelButtonTitle:@"Okay" otherButtonTitles: nil];    
        [myAlert show];
    }
    else{

    _tip = [rate.text floatValue]/100*[billAmount.text floatValue];
    }

  
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
    // Release any retained subviews of the main view.
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
