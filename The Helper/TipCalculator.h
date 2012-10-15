
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//
//

#import <UIKit/UIKit.h>
#import "connectToTipServer.h"

@interface TipCalculator : UIViewController{
    UITextField *billAmount;
    UITextField *rate;
    UISlider *slider;
}

@property (nonatomic,strong) IBOutlet UITextField *billAmount;
@property (nonatomic,strong) IBOutlet UITextField *rate;
@property (nonatomic, strong) IBOutlet UIButton *calculate;
@property double tip;
@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UILabel *billAmountLabel;
@property (nonatomic, strong) IBOutlet UILabel *rateLabel;
@property (nonatomic) BOOL tipCanBeCalculated;
@property (nonatomic) BOOL rateIsDecimal;


- (IBAction) rateTextValueChanged:(UITextField *)sender;  
- (IBAction)sliderValueChanged:(id)sender;  
- (IBAction)calculateTip:(id)sender; 
-(void)negativeAlert;
-(void)fieldEmptyAlert;

@end
