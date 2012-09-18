//
//  TipDetailViewController.h
//  The Helper
//
//  Created by Nidal on 9/12/12.
//  Copyright (c) 2012 __ABC Corp__. All rights reserved.
//
//

#import <UIKit/UIKit.h>

@interface TipDetailViewController : UIViewController
@property (nonatomic, strong) IBOutlet UILabel *tipamount;
@property (nonatomic, assign) float tip;
@end
