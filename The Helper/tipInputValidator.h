//
//  tipInputValidator.h
//  The Helper
//
//  Created by qbadmin on 10/17/12.
//
//

#import <Foundation/Foundation.h>
@class TipCalculator;
@interface tipInputValidator : NSObject
-(void)billAmountInvalidTypeAlert:(TipCalculator* )reciever withCount:(NSUInteger)count;
-(void)tipRateInvalidTypeAlert:(TipCalculator* )reciever withCount:(NSUInteger)count;
-(void)tipRateOutOfBoundsAlert: (TipCalculator* )reciever;
-(void)tipNegativeAlert:(TipCalculator*)reciever;
-(void)billAmountFieldEmptyAlert:(TipCalculator* )reciever;
-(void)tipRateFieldEmptyAlert:(TipCalculator* )reciever;

@end
