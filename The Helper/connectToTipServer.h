//
//  connectToTipServer.h
//  The Helper
//
//  Created by Nidal on 10/12/12.
//
//

#import <Foundation/Foundation.h>
@protocol tipProtocol;
@interface connectToTipServer : NSObject{
    id <tipProtocol> delegate;
}
-(void)performRequest:(double)tipAmount2 andResponse:(double)tipRate2;
@property(nonatomic,weak) NSMutableArray *tipResult;
@property(nonatomic,strong) id <tipProtocol> delegate;
@end
@protocol tipProtocol
- (void) tipCalculationDidFinish:(NSString *)xmlData ;
@end

