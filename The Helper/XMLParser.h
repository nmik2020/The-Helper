//
//  XMLParser.h
//  The Helper
//
//  Created by qbadmin on 10/15/12.
//
//


#import <Foundation/Foundation.h>
#import "tipXmlInput.h"
@protocol xml;
@interface XMLParser : NSObject {
    id <xml> delegatew;
    // an ad hoc string to hold element value
    NSMutableString *currentElementValue;
    // user object
    // array of user objects
    tipXmlInput *inputs;
    NSMutableArray *finalTip ;
   
   // NSMutableArray *rateForTip ;

}

@property (nonatomic, strong) tipXmlInput *inputs;
@property (nonatomic, strong) NSMutableArray *finalTip;
@property (nonatomic, strong) NSString *finalResult;

@property(nonatomic,strong) id <xml> delegatew;
@property(nonatomic,strong) id ew;

- (void) doParse:(NSData *)data ;
- (XMLParser *) initXMLParser;
@end

@protocol xml
-(void) sendData:(NSString*)tip;
@end


