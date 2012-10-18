//
//  emiInputValidator.m
//  The Helper
//
//  Created by Nidal on 10/17/12.
//
//

#import "emiInputValidator.h"
#import "EmiCalculator.h"

@implementation emiInputValidator
-(void)rateOutOfBoundsAlert:(EmiCalculator *)reciever
{
    
    reciever.rate.backgroundColor = [UIColor redColor];
    reciever.rate.placeholder = @"Rate per Month";
    reciever.rateErrorLabel.text = @" Enter value less than or equal to 100";
    
}
-(void)principalAmountInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger)count
{
    if(count!=[reciever.principalAmount.text length] )
    {
        reciever.principalAmount.backgroundColor = [UIColor redColor];
        reciever.principalAmount.placeholder = @"Principal Amount";
        reciever.principalAmountErrorLabel.text = @" \n Please enter valid principal amount value";
        
    }
    
  }
-(void)rateInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger)count
{
    if(count!=[reciever.rate.text length] )
    {
        reciever.rate.backgroundColor = [UIColor redColor];
        reciever.rate.placeholder = @"Rate per Month";
        reciever.rateErrorLabel.text = @" \n Please enter valid rate value";
        
    }
    
    
    
}
-(void)loantermInvalidTypeAlert:(EmiCalculator* )reciever withCount:(NSUInteger)count
{
    if(count!=[reciever.loanterm.text length] )
    {
        reciever.loanterm.backgroundColor = [UIColor redColor];
        
        reciever.loanterm.placeholder = @"Rate per Month";
        reciever.loantermErrorLabel.text = @" \n Please enter valid loanterm values";
        
    }
    
    
}

-(void)negativeAlert:(EmiCalculator* )reciever
{
    if(([reciever.principalAmount.text doubleValue])<0 )
    {
        reciever.principalAmount.backgroundColor = [UIColor redColor];
        reciever.principalAmount.placeholder = @"Principal Amount";
        
        reciever.principalAmountErrorLabel.text = @" Principal Amount Value cannot be negative";
    }
    
    if(([reciever.rate.text doubleValue])<0 )
    {
        reciever.rate.backgroundColor = [UIColor redColor];
        reciever.rate.placeholder = @"Rate per Month";
        reciever.rateErrorLabel.text = @" Rate Value cannot be negative";
    }
    
    if(([reciever.loanterm.text doubleValue])<0 )
    {
        reciever.loanterm.backgroundColor = [UIColor redColor];
        reciever.loanterm.placeholder = @"Rate per Month";
        reciever.loantermErrorLabel.text = @" Loan Term value cannot be negative";
    }
    
    
    
}
-(void)loantermFieldEmptyAlert:(EmiCalculator* )reciever
{
    reciever.loanterm.backgroundColor = [UIColor yellowColor];
    
    reciever.loanterm.placeholder  = @"Enter Loan Term Value!!!!";
    
}
-(void)principalAmountFieldEmptyAlert:(EmiCalculator* )reciever
{
    
    reciever.principalAmount.backgroundColor = [UIColor yellowColor];
    reciever.principalAmount.placeholder  = @"Enter Principal Amount Value!!!!";
}
-(void)rateFieldEmptyAlert:(EmiCalculator* )reciever
{
    reciever.rate.backgroundColor = [UIColor yellowColor];
    reciever.rate.placeholder = @"Enter Rate Values!!!!";
}

-(void)checkForErrors:(UITextField*)principalAmount inAll:(UITextField*)rate Inputs:(UITextField*)loanterm andSend:(EmiCalculator*)reciever
{   NSUInteger principalAmountCount = [self getCount:principalAmount];
    NSUInteger rateCount = [self getCount:rate];
    NSUInteger loantermCount = [self getCount:loanterm];
    if(principalAmountCount!=[principalAmount.text length] || rateCount!=[rate.text length] || loantermCount!=[loanterm.text length])
    {
        
        if(principalAmountCount!=[principalAmount.text length])
        {[self principalAmountInvalidTypeAlert:reciever withCount:principalAmountCount];
        }
        if(rateCount!=[rate.text length] && rateCount!=([rate.text length]-1))
        {[self rateInvalidTypeAlert:reciever withCount:rateCount];
            
        }
        else if(rateCount==([rate.text length]-1))
        {    reciever.gotDecimal=TRUE;
            reciever.canCalculate=TRUE;
        }
        
        if(loantermCount!=[loanterm.text length])
        {[self loantermInvalidTypeAlert:reciever withCount:loantermCount];
        }
        if (!reciever.gotDecimal) {
            reciever.canCalculate = FALSE;
        }
        
    }
    if ((![loanterm.text length]) ||(![rate.text length]) || ![principalAmount.text length] )    {
        if(![principalAmount.text length])
            [self principalAmountFieldEmptyAlert:reciever];
        if(![rate.text length])
            [self rateFieldEmptyAlert:reciever];
        if(![loanterm.text length])
            [self loantermFieldEmptyAlert:reciever];
        reciever.canCalculate=FALSE;
        
    }
    
    if(([loanterm.text doubleValue])<0 || ([rate.text doubleValue]<0) || [principalAmount.text doubleValue]<0)
    {
        [self negativeAlert:reciever];
        reciever.canCalculate=FALSE;
    }
    if([rate.text doubleValue]>100)
    {
        [self rateOutOfBoundsAlert:reciever];
        reciever.canCalculate=FALSE;
        
    }
}
    

    
   
    

-(NSUInteger)getCount:(UITextField*)inputText{
    NSError *error = NULL;
     NSRegularExpression *regexString = [NSRegularExpression regularExpressionWithPattern:@"(\\d)" options:NSRegularExpressionSearch error:&error];
    NSUInteger textCount = [regexString  numberOfMatchesInString:inputText.text
                                                                    options:0 range:NSMakeRange(0, [inputText.text length])];
    return textCount;
}


@end
