//
//  coreCalculations.h
//  The Helper
//
//  Created by qbadmin on 9/28/12.
//
//

#import <Foundation/Foundation.h>

@interface coreCalculations : NSNumber
- (double)calculateEmi:(double)rate perMonth:(double)principal ofLoan:(double)period;
- (double)calculateInterest:(double)emi of:(double)period Loan:(double)principal;
- (double)calculateTotalAmount:(double)amount paid:(double)interest;
-(double)tipValue:(double)billRate ofAmount:(double)billAmount;


@end
