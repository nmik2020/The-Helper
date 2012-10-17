//
//  emiInputValidator.h
//  The Helper
//
//  Created by qbadmin on 10/17/12.
//
//

#import <Foundation/Foundation.h>
//#import "EmiCalculator.h"
@class EmiCalculator;
@interface emiInputValidator:NSObject{
    
}
-(void)rateOutOfBoundsAlert:(EmiCalculator*)reciever;
-(void)negativeAlert:(EmiCalculator* )reciever;
-(void)principalAmountInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger )count
;

-(void)rateInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger )count
;
-(void)loantermInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger )count;
-(void)loantermFieldEmptyAlert:(EmiCalculator* )reciever;
-(void)principalAmountFieldEmptyAlert:(EmiCalculator* )reciever;
-(void)rateFieldEmptyAlert:(EmiCalculator* )reciever;
-(void)checkForErrors:(UITextField*)principalAmount inAll:(UITextField*)rate Inputs:(UITextField*)loanterm andSend:(EmiCalculator*)reciever;
-(NSUInteger)getCount:(UITextField*)text;
@end
