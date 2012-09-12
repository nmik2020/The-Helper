//
//  LoanDetailViewController.h
//  The Helper
//
//  Created by qbadmin on 9/11/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LoanDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *monthlypayment;
@property (nonatomic, strong) IBOutlet UILabel *simpleinterest;
@property (nonatomic, strong) IBOutlet UILabel *totalpayment;


@property (nonatomic, assign) double emi;
@property (nonatomic, assign) double interest;
@property (nonatomic, assign) double totalamount;


@end
