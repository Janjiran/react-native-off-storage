
#if __has_include("RCTBridgeModule.h")
#import "RCTBridgeModule.h"
#import <Foundation/Foundation.h>
#else
#import <React/RCTBridgeModule.h>
#import <Foundation/Foundation.h>
#endif

@interface RNOffStorage : NSObject <RCTBridgeModule>
- (NSString*) resolvePath:(NSString*)name;
@end
  
