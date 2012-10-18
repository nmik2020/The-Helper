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
@synthesize finalTip,finalResult,check;
@synthesize delegatew;
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
        //check = [[NSMutableDictionary alloc]init ];
        NSLog(@"Parsed first tag TipOutput");
        //[check setObject:[attributeDict objectForKey:@"value"] forKey:@"value"];
        NSLog(@"Setting into dictionary Check %@",[check valueForKey:@"value"]);
    }
    if ([elementName isEqualToString:@"Tip"]) {
        NSLog(@"Parsed second tag Tip");
        
    }

}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        TipCalculator *tipSolver = [[TipCalculator alloc]init];
        currentElementValue = [[NSMutableString alloc] initWithString:string];
        if(!finalResult)
        {finalResult = [[NSString alloc]init];

        
        }
        finalResult = string;
        [tipSolver getValue:finalResult];
        NSLog(@"Final result : %@",finalResult);
        [self.delegatew sendData:finalResult];

    } else {
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

}



- (void) doParse:(NSData *)data {
    
   
//    BOOL success = [nsXmlParser parse];
    parser			= [[NSXMLParser alloc] initWithData:data];
	parser.delegate = self;
	[parser parse];
    // test the result
//    if (success) {
//        NSLog(@"No errors - user count : %i", finalTip.count);
//        NSLog(@"Final result inside do parse: %@",currentElementValue);
//
//        // get array of users here
//        //  NSMutableArray *users = [parser users];
//    } else {
//        NSLog(@"Error parsing document!");
//    }
    
    
    
}
@end
