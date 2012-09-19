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
    UISlider *slider;
}

@property (nonatomic,strong) IBOutlet UITextField *billAmount;
@property (nonatomic,strong) IBOutlet UITextField *rate;
@property (nonatomic, strong) IBOutlet UIButton *calculate;
@property float tip;
@property (nonatomic, strong) IBOutlet UISlider *slider;


- (IBAction) rateTextValueChanged:(UITextField *)sender;  
- (IBAction)sliderValueChanged:(id)sender;  
- (IBAction)calculateTip:(id)sender; 
-(void)negativeAlert;
-(void)fieldEmptyAlert;
-(float)tipValue;

@end
