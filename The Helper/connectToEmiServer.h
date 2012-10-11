//
//  connectToEmiServer.h
//  The Helper
//
//  Created by qbadmin on 10/11/12.
//
//

#import <Foundation/Foundation.h>

@interface connectToEmiServer : NSObject
- (void)sendRequestToCalculate:(double)amount andFetch:(double)loanterm Response:(double)rate;
-(void)test;
@end
