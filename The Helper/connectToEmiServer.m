//
//  connectToEmiServer.m
//  The Helper
//
//  Created by Nidal on 10/11/12.
//
//

#import "connectToEmiServer.h"
#import "JSON.h"
#import "EmiCalculator.h"
@implementation connectToEmiServer
@synthesize resultArray= _resultArray;
@synthesize delegate;
NSMutableData *webData ;
NSXMLParser *parser;
-(void)test{
    NSLog(@"Hello");
}

-(void)performRequest:(double)amount andFetch:(double)loanterm Response:(double)rate{
    NSString *initialURL = [NSString stringWithFormat:@"http://localhost:8888/PhpProject1/EmiServer.php"];
    NSURL *url=[NSURL URLWithString:initialURL];
    
    NSString *key = [NSString stringWithFormat:@"&totalamount=%0.02f&rate=%0.02f&period=%0.02f", amount,rate,loanterm];
    NSData *mastData = [key dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *mastLength = [NSString stringWithFormat:@"%d",[mastData length]];
    
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:url];
    [request setHTTPMethod:@"POST"];
    [request setValue:mastLength forHTTPHeaderField:@"Content-Length"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody:mastData];
   
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if( theConnection )
    {
        webData = [NSMutableData data] ;
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    
}

-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [webData setLength: 0];
    self.resultArray = [[NSMutableArray alloc] init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [webData appendData:data];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"ERROR with theConenction");
    NSDictionary *errorDic = [NSDictionary dictionaryWithObject:error forKey:@"error"];
    [self.resultArray addObject:errorDic];
    [webData setLength:0];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"DONE. Received Bytes: %d", [webData length]);
    NSString *json = [[NSString alloc] initWithBytes: [webData mutableBytes] length:[webData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@", json);
    NSMutableDictionary *results = [json JSONValue];
         NSLog(@"EMI %@",[results valueForKey:@"emi"]);
    [self.delegate calculationDidFinish:results];

    if([webData length] > 0){
        parser = [[NSXMLParser alloc] initWithData:webData];
        [parser setDelegate:(id)self];
        [parser parse];
    }
}
@end
