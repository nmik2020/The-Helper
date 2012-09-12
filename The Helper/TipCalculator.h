//
//  PrincipalSecondViewController.h
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipCalculator : UIViewController{
    UITextField *billAmount;
    UITextField *rate;
}
@property (nonatomic, retain) IBOutlet UISlider *mySlider;  
@property (nonatomic,retain) IBOutlet UITextField *billAmount;
@property (nonatomic,retain) IBOutlet UITextField *rate;
@property (nonatomic, strong) IBOutlet UIButton *calculate;
@property double tip;

- (IBAction) sliderValueChanged:(id)sender;  
- (IBAction)calculateTip:(id)sender; 

@end
