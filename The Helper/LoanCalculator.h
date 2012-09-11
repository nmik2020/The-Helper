//
//  PrincipalFirstViewController.h
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoanCalculator : UIViewController{
UITextField *principalAmount;
    UITextField *rate;
    UITextField *loanTerm;
    UIButton *calculate;
    NSArray *results;


}
@property (nonatomic,retain) IBOutlet UITextField *principalAmount;
@property (nonatomic,retain) IBOutlet UITextField *rate;
@property (nonatomic,retain) IBOutlet UITextField *loanterm;
@property (nonatomic, strong) IBOutlet UILabel *showLabel;
@property (nonatomic, strong) IBOutlet UIButton *calculate;
@property (nonatomic,strong) NSArray *results;


- (IBAction)calculateLoan:(id)sender; 
- (IBAction)backgroundTouchedHideKeyboard:(id)sender ;
@end
