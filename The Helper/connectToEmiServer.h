//
//  connectToEmiServer.h
//  The Helper
//
//  Created by qbadmin on 10/11/12.
//
//

#import <Foundation/Foundation.h>
@protocol EmiProtocol;

@interface connectToEmiServer : NSObject {
    id <EmiProtocol> delegate;
}

-(void)performRequest:(double)amount andFetch:(double)loanterm Response:(double)rate;

@property(nonatomic,weak) NSMutableArray *resultArray;
@property(nonatomic, strong) id <EmiProtocol> delegate;
@end

@protocol EmiProtocol
- (void) calculationDidFinish:(NSMutableDictionary *)dictionary;
@end