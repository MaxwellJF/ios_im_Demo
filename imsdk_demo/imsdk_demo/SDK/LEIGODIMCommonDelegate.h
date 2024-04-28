// LEIGODIMCommonDelegate.h

#import <Foundation/Foundation.h>

typedef void(^Succ)(NSString *);
typedef void(^Fail)(int, NSString *);

@protocol LEIGODIMCommonDelegate <NSObject>
- (void)sdkDidReceiveMessage:(NSString *)message;
- (void)sdkDidReceiveNotification:(NSString *)notification;
- (void)sdkDidReceiveEvent:(NSString *)event;
@end