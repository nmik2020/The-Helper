//
//  PrincipalFirstViewController.h
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoanCalculator : UIViewController {
UITextField *principalAmount;
    UITextField *rate;
    UITextField *loanTerm;
    UIButton *calculate;
    }
@property (nonatomic,retain) IBOutlet UITextField *principalAmount;
@property (nonatomic,retain) IBOutlet UITextField *rate;
@property (nonatomic,retain) IBOutlet UITextField *loanterm;
@property (nonatomic, strong) IBOutlet UILabel *showLabel;
@property (nonatomic, strong) IBOutlet UIButton *calculate;
@property float emi;
@property float interest;
@property float totalAmount;
- (IBAction) sliderValueChanged:(id)sender;  
- (IBAction)calculateLoan:(id)sender; 
- (float)calculateEmi; 
- (float)calculateInterest; 
- (float)calculateTotalAmount;

- (IBAction)backgroundTouchedHideKeyboard:(id)sender ;
@end
