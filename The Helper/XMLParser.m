//
//  XMLParser.m
//  The Helper
//
//  Created by Nidal on 10/15/12.
//
//


#import "XMLParser.h"

@implementation XMLParser
- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	if(!detailDic)
        detailDic = [[NSMutableDictionary alloc]init];

    if ([elementName isEqualToString:@"TipInput"]) {
        NSLog(@"user element found – create a new instance of User class...");
    }
        if ([elementName isEqualToString:@"BillAmount"]) {
            NSLog(@"Found Bill");
        }
    if ([elementName isEqualToString:@"Rate"]) {
        NSLog(@"rate");
        NSLog(@"Element Name %@",elementName);
        NSLog(@"Namespace URI %@",namespaceURI);
        NSLog(@"Qualified Name%@",qualifiedName);
         NSLog(@"NSDICT 2%@",[attributeDict valueForKey:@"Rate"]);
        NSLog(@"NSDICt1 %@",[attributeDict valueForKey:@"BillAmount"]);



    }
    

}

- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError {
    
        NSLog(@" Error %@",parseError);
    }



- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
   
    if (!currentElementValue) {
        // init the ad hoc string with the value
        currentElementValue = [[NSMutableString alloc] initWithString:string];
    } else {
        // append value to the ad hoc string
        [currentElementValue appendString:string];
    }
//    NSLog(@"Processing value for : %@", string);
//    currentElementValue = (NSMutableString *) [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
//    if ([string isEqualToString:@"BillAmount"]) {
//        NSLog(@"Found Bill Amount");
//    }
//    if ([string isEqualToString:@"RATE"]) {
//        NSLog(@"Found RATE");
//    }
}
    



- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{ if ([elementName isEqualToString:@"Tip Input"]) {
    NSLog(@"End of XML Document");
    }
}
@end
