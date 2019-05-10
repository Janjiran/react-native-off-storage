
#import "RNOffStorage.h"

@implementation RNOffStorage

- (dispatch_queue_t)methodQueue
{
    return dispatch_get_main_queue();
}
RCT_EXPORT_MODULE();

- (NSString*) resolvePath:(NSString*)name {
  NSArray *paths = NSSearchPathForDirectoriesInDomains (NSDocumentDirectory, NSUserDomainMask, YES);
  NSString *documentsDirectory = [paths objectAtIndex:0];
  NSString *fileName = [NSString stringWithFormat:@"%@/%@", documentsDirectory, name];
  return fileName;
}

RCT_REMAP_METHOD(_saveAsync, to:(NSString*)to base64:(NSString *)base64 resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject )
{
  @try {

    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileName = [self resolvePath:to];


    NSURL * _Nullable url = [NSURL fileURLWithPath:fileName];
    if(url){
      [fileManager createDirectoryAtURL:[url URLByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
    }

    [base64 writeToFile:fileName atomically:YES encoding:NSASCIIStringEncoding error:nil];
    resolve(@(TRUE));
  } @catch(NSException *exception) {
    reject([exception name], [exception reason], NULL);
  }
}


RCT_EXPORT_METHOD(save:(NSString *)to base64:(NSString *)base64)
{
  @try {
    NSFileManager *fileManager = [NSFileManager defaultManager];

    NSString *fileName = [self resolvePath:to];


    NSURL * _Nullable url = [NSURL fileURLWithPath:fileName];
    if(url){
      [fileManager createDirectoryAtURL:[url URLByDeletingLastPathComponent] withIntermediateDirectories:YES attributes:nil error:nil];
    }

    [base64 writeToFile:fileName atomically:YES encoding:NSASCIIStringEncoding error:nil];


  }@catch(NSException *exception) {
  }
}

RCT_REMAP_METHOD(load, from:(NSString*)from resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject )
{
  @try {
    NSString *fileName = [self resolvePath:from];
    NSString* content = [[NSString alloc] initWithContentsOfFile:fileName encoding:NSASCIIStringEncoding error:nil];
    resolve(content);
  } @catch(NSException *exception) {
    reject([exception name], [exception reason], NULL);
  }
}


RCT_REMAP_METHOD(exists, name:(NSString*)name resolver:(RCTPromiseResolveBlock)resolve rejecter:(RCTPromiseRejectBlock)reject )
{
  @try {
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSString *fileName = [self resolvePath:name];
    BOOL data = [fileManager fileExistsAtPath:fileName];
    if(data == TRUE){
      resolve(@(TRUE));
    }else{
      resolve(@(FALSE));
    }
  } @catch(NSException *exception) {
    reject([exception name], [exception reason], NULL);
  }
}

@end
