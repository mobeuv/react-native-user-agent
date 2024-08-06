#import <React/RCTBridgeModule.h>

@interface RCT_EXTERN_MODULE(ReactNativeUserAgent, NSObject)

RCT_EXTERN_METHOD(getUserAgent:(RCTPromiseResolveBlock)resolve
                 withRejecter:(RCTPromiseRejectBlock)reject)


+ (BOOL)requiresMainQueueSetup
{
  return NO;
}

@end
