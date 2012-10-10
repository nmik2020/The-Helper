//
//  Exceptions.m
//  The Helper
//
//  Created by Nidal on 10/3/12.
//
//

#import "Exceptions.h"
#import "EmiCalculator.h"
#import "TipCalculator.h"
@implementation Exceptions
@synthesize errorMessage;
///// EMI Exception Functions  ////////////////////////
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
///// Tip Exception Functions  ////////////////////////
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
