//
//  XMLParser.m
//  The Helper
//
//  Created by Nidal on 10/15/12.
//
//


#import "XMLParser.h"
#import "TipCalculator.h"
@implementation XMLParser
@synthesize inputs, finalTip,finalResult;
@synthesize delegatew;
@synthesize ew;
- (XMLParser *) initXMLParser {
	
	self = [super init];
	
    finalTip = [[NSMutableArray alloc] init];

	return self;
}
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"TipOutput"]) {
        NSLog(@"Parsed first tag TipOutput");
       // inputs = [[tipXmlInput alloc] init];
        
    }
    if ([elementName isEqualToString:@"Tip"]) {
        NSLog(@"Parsed second tag Tip");
        // inputs = [[tipXmlInput alloc] init];
        
    }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        TipCalculator *tipSolver = [[TipCalculator alloc]init];
        // init the ad hoc string with the value
        currentElementValue = [[NSMutableString alloc] initWithString:string];
        if(!finalResult)
        {finalResult = [[NSString alloc]init];

        finalResult = string;
        }
        [tipSolver getValue:finalResult];
        NSLog(@"Final result : %@",finalResult);
        [self.delegatew sendData:finalResult];

    } else {
        // append value to the ad hoc string
        [currentElementValue appendString:string];
    }
    NSLog(@"Processing value for : %@", string);
}

- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"TipOutput"]) {
        return;
    }
//    
//    if ([elementName isEqualToString:@"Tip"]) {
//        
//        if(!finalTip)
//        { [finalTip addObject:inputs];
//                        
//       
//        }
//
//           }
//    else {
// 
//        [inputs setValue:currentElementValue forKey:elementName];
//    }
//
    
    //currentElementValue = nil;
}



- (void) doParse:(NSData *)data {
    
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    XMLParser *parser = [[XMLParser alloc] initXMLParser];
    
    [nsXmlParser setDelegate:parser];
    
    BOOL success = [nsXmlParser parse];
    
    // test the result
    if (success) {
        NSLog(@"No errors - user count : %i", finalTip.count);
        NSLog(@"Final result inside do parse: %@",currentElementValue);

        // get array of users here
        //  NSMutableArray *users = [parser users];
    } else {
        NSLog(@"Error parsing document!");
    }
    
    
    
}
@end
