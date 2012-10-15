//
//  XMLParser.h
//  The Helper
//
//  Created by qbadmin on 10/15/12.
//
//


#import <Foundation/Foundation.h>

@class User;

@interface XMLParser : NSObject {
    // an ad hoc string to hold element value
    NSMutableString *currentElementValue;
    // user object
    // array of user objects
    NSMutableDictionary *detailDic ;
}



@end

