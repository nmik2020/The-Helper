//
//  TipDetailViewController.h
//  The Helper
//
//  Created by qbadmin on 9/12/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TipDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *tipamount;
@property (nonatomic, assign) double tip;
@end
