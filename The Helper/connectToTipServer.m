//
//  connectToTipServer.m
//  The Helper
//
//  Created by Nidal on 10/12/12.
//
//

#import "connectToTipServer.h"
@implementation connectToTipServer
@synthesize tipResult= _tipResult;
@synthesize delegate;
NSMutableData *tipData ;
NSXMLParser *tipParser;


-(void)performRequest:(double)tipAmount2 andResponse:(double)tipRate2
{
    NSLog(@"Entered");
    NSString *tipURL = [NSString stringWithFormat:@"http://localhost:8888/PhpProject1/index.php"];
    NSURL *link=[NSURL URLWithString:tipURL];
    
    NSString *tipKey = [NSString stringWithFormat:@"&billamount=%0.02f&rate=%0.02f", tipAmount2,tipRate2];
    NSData *mastDataTip = [tipKey dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES];
    NSString *mastLengthTip = [NSString stringWithFormat:@"%d",[mastDataTip length]];
    
    NSMutableURLRequest *tipRequest = [[NSMutableURLRequest alloc] init];
    [tipRequest setURL:link];
    [tipRequest setHTTPMethod:@"POST"];
    [tipRequest setValue:mastLengthTip forHTTPHeaderField:@"Content-Length"];
    [tipRequest setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    [tipRequest setHTTPBody:mastDataTip];
    
    NSURLConnection *theConnectionTip = [[NSURLConnection alloc] initWithRequest:tipRequest delegate:self];
    if( theConnectionTip )
    {
        tipData = [NSMutableData data] ;
    }
    else
    {
        NSLog(@"theConnection is NULL");
    }
    
}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response{
    [tipData setLength: 0];
    self.tipResult = [[NSMutableArray alloc] init];
}
-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data{
    [tipData appendData:data];
    
}
-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error{
    NSLog(@"ERROR with theConenction");
    NSDictionary *errorDicTip = [NSDictionary dictionaryWithObject:error forKey:@"error"];
    [self.tipResult addObject:errorDicTip];
    [tipData setLength:0];
}
-(void)connectionDidFinishLoading:(NSURLConnection *)connection{
    NSLog(@"DONE. Received Bytes: %d", [tipData length]);
    NSString *theXML = [[NSString alloc] initWithBytes: [tipData mutableBytes] length:[tipData length] encoding:NSUTF8StringEncoding];
    NSLog(@"%@", theXML);
    [self.delegate tipCalculationDidFinish:theXML];

//    if([tipData length] > 0){
//        tipParser = [[NSXMLParser alloc] initWithData:tipData];
//        [tipParser setDelegate:self];
//        [tipParser parse];
//}
}
@end
