//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "emiInputValidator.h"
@interface EmiCalculator : UIViewController{
   UITextField *principalAmount;
   UIButton *calculate;
   UISlider *slider;
   UIScrollView *scrollView;
   UIViewController   *activeField;

    }
@property (nonatomic,strong) IBOutlet UITextField *principalAmount;
@property (nonatomic,strong) IBOutlet UITextField *rate;
@property (nonatomic,strong) IBOutlet UITextField *loanterm;

@property (nonatomic, strong) IBOutlet UISlider *slider;
@property (nonatomic, strong) IBOutlet UILabel *principalAmountErrorLabel;
@property (nonatomic, strong) IBOutlet UILabel *rateErrorLabel;
@property (nonatomic, strong) IBOutlet UILabel *loantermErrorLabel;
@property(nonatomic)        BOOL        canCalculate;
@property(nonatomic)        BOOL        gotDecimal;


@property double emi;
@property double interest;
@property double totalAmount;



- (IBAction) sliderValueChanged:(id)sender;  
- (IBAction) rateTextValueChanged:(UITextField *)sender;  
- (IBAction)calculateEmi:(id)sender; 
- (IBAction)backgroundTouchedHideKeyboard:(id)sender ;

@end
