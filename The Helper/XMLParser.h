//
//  XMLParser.h
//  The Helper
//
//  Created by Nidal on 10/15/12.
//
//


#import <Foundation/Foundation.h>
@protocol xml;
@interface XMLParser : NSObject<NSXMLParserDelegate> {
    id <xml> delegatew;
    NSMutableString *currentElementValue;
    NSMutableArray *finalTip ;
    NSXMLParser		*parser;
}

@property (nonatomic, strong) NSMutableArray *finalTip;
@property (nonatomic, strong) NSString *finalResult;
@property (nonatomic,strong) NSMutableDictionary *check;
@property(nonatomic,strong) id <xml> delegatew;

- (void) doParse:(NSData *)data ;
- (XMLParser *) initXMLParser;
@end

@protocol xml
-(void) sendData:(NSString*)tip;
@end


