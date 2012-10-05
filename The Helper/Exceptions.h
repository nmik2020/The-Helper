//
//  Exceptions.h
//  The Helper
//
//  Created by qbadmin on 10/3/12.
//
//

#import <Foundation/Foundation.h>
#import "EmiCalculator.h"
#import "TipCalculator.h"
@interface Exceptions : UIViewController
@property (nonatomic,strong) IBOutlet UILabel *errorMessage;

-(void)rateOutOfBoundsAlert:(EmiCalculator *)reciever;
-(void)negativeAlert:(EmiCalculator* )reciever;
-(void)principalAmountInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger )count
;

-(void)rateInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger )count
;
-(void)loantermInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger )count;
-(void)loantermFieldEmptyAlert:(EmiCalculator* )reciever;
-(void)principalAmountFieldEmptyAlert:(EmiCalculator* )reciever;
-(void)rateFieldEmptyAlert:(EmiCalculator* )reciever;
-(void)tipRateOutOfBoundsAlert: (TipCalculator* )reciever;
-(void)tipNegativeAlert:(TipCalculator*)reciever;
-(void)tipFieldEmptyAlert:(TipCalculator*)reciever;
-(void)billAmountInvalidTypeAlert:(TipCalculator* )reciever withCount:(NSUInteger)count;
-(void)tipRateInvalidTypeAlert:(TipCalculator* )reciever withCount:(NSUInteger)count;

@end
