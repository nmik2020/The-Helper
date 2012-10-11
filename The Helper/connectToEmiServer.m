//
//  connectToEmiServer.m
//  The Helper
//
//  Created by qbadmin on 10/11/12.
//
//

#import "connectToEmiServer.h"
#import "JSON.h"
@implementation connectToEmiServer
//- (void)sendRequestToCalculate:(double)amount andFetch:(double)loanterm Response:(double)rate
//{
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc]
//                                    initWithURL:[NSURL
//                                                 URLWithString:@"http://localhost:8888/PhpProject1/index.php"]];
//    
//    [request setHTTPMethod:@"POST"];
//    [request setValue:@"text/xml"
//   forHTTPHeaderField:@"Content-type"];
//    
//    NSString *xmlString = @"<data><item>Item 1</item><item>Item 2</item></data>";
//    
//    [request setValue:[NSString stringWithFormat:@"%d",
//                       [xmlString length]]
//   forHTTPHeaderField:@"Content-length"];
//    
//    [request setHTTPBody:[xmlString
//                          dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    [[NSURLConnection alloc] 
//     initWithRequest:request 
//     delegate:self];
//}
//
//NSURLRequest *theRequest=[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://www.apple.com/"]
//                                          cachePolicy:NSURLRequestUseProtocolCachePolicy
//                                      timeoutInterval:60.0];
//// create the connection with the request
//// and start loading the data
//NSURLConnection *theConnection=[[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
//if (theConnection) {
//    // Create the NSMutableData to hold the received data.
//    // receivedData is an instance variable declared elsewhere.
//    receivedData = [[NSMutableData data] retain];
//} else {
//    // Inform the user that the connection failed.
//}

//prepar request
-(void)test{
    NSString *urlString = [NSString stringWithFormat:@"http://localhost:8888/PhpProject1/index.php"];
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init] ;
    [request setURL:[NSURL URLWithString:urlString]];
    [request setHTTPMethod:@"POST"];

//set headers
    NSString *contentType = [NSString stringWithFormat:@"text/xml"];
    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];

//create the body
    NSMutableData *postBody = [NSMutableData data];
//    [postBody appendData:[[NSString stringWithFormat:@"<xml>"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [postBody appendData:[[NSString stringWithFormat:@"<yourcode/>"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [postBody appendData:[[NSString stringWithFormat:@"</xml>"] dataUsingEncoding:NSUTF8StringEncoding]];

//post
    [request setHTTPBody:postBody];

//get response
NSHTTPURLResponse* urlResponse = nil;
NSError *error = [[NSError alloc] init];
NSData *responseData = [NSURLConnection sendSynchronousRequest:request returningResponse:&urlResponse error:&error];
NSString *result = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
NSLog(@"Response Code: %d", [urlResponse statusCode]);
if ([urlResponse statusCode] >= 200 && [urlResponse statusCode] < 300) {
    NSLog(@"Response: %@", result);
    NSString* json_string = [[NSString alloc] initWithData:responseData encoding:NSUTF8StringEncoding];
   // NSDictionary *testDict = [json_string JSONValue];
    NSLog(@"Response: %@", json_string);
    NSDictionary *testDict = [json_string JSONValue];
    result=[NSString stringWithFormat:@"Result is %@",[testDict valueForKey:@"sum"]];
}
}
@end
