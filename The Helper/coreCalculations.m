//
//  coreCalculations.m
//  The Helper
//
//  Created by Nidal on 9/28/12.
//
//

#import "coreCalculations.h"

@implementation coreCalculations
double emi;
double interest;
double totalAmount;
double monthlyrate;
double tip;
- (double)calculateEmi:(double)rate perMonth:(double)principal ofLoan:(double)period
{
    monthlyrate = (rate/12/100); //Equation to calculate monthly rate
    emi = (principal*monthlyrate*(pow((1+monthlyrate), period)))/(pow((1+monthlyrate), period)-1); //Equation to find EMI
    return emi;
}
- (double)calculateInterest:(double)emi of:(double)period Loan:(double)principal{
    interest = (emi*period) - principal;
    return interest;
}
- (double)calculateTotalAmount:(double)amount paid:(double)interest{
    totalAmount = amount + interest;
    return totalAmount;
}
-(double)tipValue:(double)billRate ofAmount:(double)billAmount
{
    tip = billRate/100*billAmount;
    return tip;
}
@end
