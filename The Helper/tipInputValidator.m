//
//  tipInputValidator.m
//  The Helper
//
//  Created by qbadmin on 10/17/12.
//
//

#import "tipInputValidator.h"
#import "TipCalculator.h"
@implementation tipInputValidator
-(void)billAmountInvalidTypeAlert:(TipCalculator* )reciever withCount:(NSUInteger)count
{
    if(count!=[reciever.billAmount.text length] )
    {
        reciever.billAmount.backgroundColor = [UIColor redColor];
        reciever.billAmount.placeholder = @"Bill Amount";
        reciever.billAmountLabel.text = @" \n Please enter valid Bill Amount";
        
    }
    
    
    
}
-(void)tipRateInvalidTypeAlert:(TipCalculator* )reciever withCount:(NSUInteger)count
{
    if(count!=[reciever.rate.text length] )
    {
        reciever.rate.backgroundColor = [UIColor redColor];
        reciever.rate.placeholder = @"Tip Rate";
        reciever.rateLabel.text = @" \n Please enter valid rate value";
        
    }
    
    
    
}


-(void)tipRateOutOfBoundsAlert:(TipCalculator*)reciever
{
    reciever.rate.backgroundColor = [UIColor redColor];
    reciever.rate.placeholder = @"Tip Rate";
    reciever.rateLabel.text = @" Enter value less than or equal to 100";
}
-(void)tipNegativeAlert:(TipCalculator*)reciever
{   if(([reciever.billAmount.text doubleValue])<0 )
{
    reciever.billAmount.backgroundColor = [UIColor redColor];
    reciever.billAmount.placeholder = @"Bill Amount";
    
    reciever.billAmountLabel.text = @" Bill Amount cannot be negative";
}
    if(([reciever.rate.text doubleValue])<0 )
    {
        reciever.rate.backgroundColor = [UIColor redColor];
        reciever.rate.placeholder = @"Tip Rate";
        
        reciever.rateLabel.text = @" Tip cannot be negative";
    }
    
    
}
-(void)billAmountFieldEmptyAlert:(TipCalculator* )reciever
{
    
    reciever.billAmount.backgroundColor = [UIColor yellowColor];
    reciever.billAmount.placeholder  = @"Enter Bill Amount Value!!!!";
}
-(void)tipRateFieldEmptyAlert:(TipCalculator* )reciever
{
    reciever.rate.backgroundColor = [UIColor yellowColor];
    reciever.rate.placeholder = @"Enter Tip Rate Values!!!!";
}


@end
