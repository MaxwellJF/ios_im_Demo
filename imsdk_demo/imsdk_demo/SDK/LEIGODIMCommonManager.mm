// LEIGODIMCommonManager.mm

#import "LEIGODIMCommonManager.h"
#include "leigod-im-cross-sdk.h"

#define kLogM(data) NSLog(@"%@", [NSString stringWithFormat:@"%@", data]);

@interface LEIGODIMCommonManager ()

@property (nonatomic, strong) NSPointerArray *commonDelegates;

@end

@implementation LEIGODIMCommonManager

+ (instancetype)sharedCommonManager {
    static LEIGODIMCommonManager *sharedCommonManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedCommonManager = [[self alloc] init];
        sharedCommonManager.commonDelegates = [NSPointerArray weakObjectsPointerArray];
    });
    return sharedCommonManager;
}

- (void)sdkSetConfig:(NSString *)resPath
          maxLogSize:(NSInteger)maxLogSize
        numLogSize:(NSInteger)numLogSize {
    std::string c_resPath = [resPath UTF8String];
    //kLogM(@"sdkSetConfig)
    SdkSetConfig(c_resPath, static_cast<int>(maxLogSize), static_cast<int>(numLogSize));
}

- (void)sdkInitWithServerLSBURL:(NSString *)serverLSBURL
                     serverLSBPort:(NSString *)serverLSBPort
                          appId:(NSString *)appId
                        imToken:(NSString *)imToken
                        succ:(Succ)succ
                        fail:(Fail)fail {
    // 转换NSString到std::string
    std::string c_serverLSBURL = [serverLSBURL UTF8String];
    std::string c_serverLSBPort = [serverLSBPort UTF8String];
    std::string c_appId = [appId UTF8String];
    std::string c_imToken = [imToken UTF8String];
    
    MSGCALLBACK msgCallback = [](const std::string& received_msg, void* user_data) {
        __strong LEIGODIMCommonManager *manager = (__bridge_transfer LEIGODIMCommonManager *)user_data;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSInteger i = 0; i < manager.commonDelegates.count; i++) {
                id<LEIGODIMCommonDelegate> obj = (__bridge id<LEIGODIMCommonDelegate>)[manager.commonDelegates pointerAtIndex:i];
                if ([obj conformsToProtocol:@protocol(LEIGODIMCommonDelegate)] && [obj respondsToSelector:@selector(sdkDidReceiveMessage:)]) {
                    [obj sdkDidReceiveMessage:@(received_msg.c_str())];
                }
            }
        });
    };
    
    NOTIFYCALLBACK notifyCallback = [](const std::string& notify_msg, void* user_data) {
        __strong LEIGODIMCommonManager *manager = (__bridge_transfer LEIGODIMCommonManager *)user_data;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSInteger i = 0; i < manager.commonDelegates.count; i++) {
                id<LEIGODIMCommonDelegate> obj = (__bridge id<LEIGODIMCommonDelegate>)[manager.commonDelegates pointerAtIndex:i];
                if ([obj conformsToProtocol:@protocol(LEIGODIMCommonDelegate)] && [obj respondsToSelector:@selector(sdkDidReceiveNotification:)]) {
                    [obj sdkDidReceiveNotification:@(notify_msg.c_str())];
                }
            }
        });
        
    };
    EVENTCALLBACK eventCallback = [](const std::string& event_msg, void* user_data) {
        __strong LEIGODIMCommonManager *manager = (__bridge_transfer LEIGODIMCommonManager *)user_data;
        
        dispatch_async(dispatch_get_main_queue(), ^{
            for (NSInteger i = 0; i < manager.commonDelegates.count; i++) {
                id<LEIGODIMCommonDelegate> obj = (__bridge id<LEIGODIMCommonDelegate>)[manager.commonDelegates pointerAtIndex:i];
                if ([obj conformsToProtocol:@protocol(LEIGODIMCommonDelegate)] && [obj respondsToSelector:@selector(sdkDidReceiveEvent:)]) {
                    [obj sdkDidReceiveEvent:@(event_msg.c_str())];
                }
            }
        });
    };
    
    void* userData = (__bridge_retained void*)(self);
    SdkInit(c_serverLSBURL, c_serverLSBPort, c_appId, c_imToken, [self, succ](std::string message) {
        dispatch_async(dispatch_get_main_queue(), ^{
            succ(@(message.c_str()));
        });
    }, [self, fail](int errorCode, std::string message) {
        dispatch_sync(dispatch_get_main_queue(), ^{
            fail(errorCode, @(message.c_str()));
        });
    }, msgCallback, notifyCallback, eventCallback, userData);
}

- (void)addListener:(id<LEIGODIMCommonDelegate>)listener {
    [self.commonDelegates addPointer:(__bridge void * _Nullable)(listener)];
}
- (void)removeListener:(id<LEIGODIMCommonDelegate>)listener {
    // 查找元素
    NSUInteger index = NSNotFound;
    for (NSUInteger i = 0; i < self.commonDelegates.count; i++) {
        id<LEIGODIMCommonDelegate> current = (__bridge id<LEIGODIMCommonDelegate>)[self.commonDelegates pointerAtIndex:i];
        if ([current isEqual:listener]) {
            index = i;
            break;
        }
    }
    if (index != NSNotFound) {
        [self.commonDelegates removePointerAtIndex:index];
    } else {
        NSLog(@"Not Found");
    }
}
@end
