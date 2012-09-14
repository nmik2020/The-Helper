//
//  PrincipalSecondViewController.h
//  The Helper
//
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface TipCalculator : UIViewController{
    UITextField *billAmount;
    UITextField *rate;
}

@property (nonatomic,retain) IBOutlet UITextField *billAmount;
@property (nonatomic,retain) IBOutlet UITextField *rate;
@property (nonatomic, strong) IBOutlet UIButton *calculate;
@property float tip;

- (IBAction)sliderValueChanged:(id)sender;  
- (IBAction)calculateTip:(id)sender; 
-(void)negativeAlert;
-(void)fieldEmptyAlert;

@end
