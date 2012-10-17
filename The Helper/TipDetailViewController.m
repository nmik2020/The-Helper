
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import "TipDetailViewController.h"

@implementation TipDetailViewController
@synthesize tipamount=_tipamount;
@synthesize tip;

- (void)viewDidLoad
{
    
    [super viewDidLoad];
   
    NSString *myNewString = [NSString stringWithFormat:@"%0.02f", self.tip];
    self.tipamount.text = myNewString;
    
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}
- (void)viewWillDisappear:(BOOL)animated 
{
   self.tipamount.text = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end

