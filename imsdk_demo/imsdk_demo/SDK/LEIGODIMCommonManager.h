// LEIGODIMCommonManager.h

#import <Foundation/Foundation.h>
#import "LEIGODIMCommonDelegate.h"

@interface LEIGODIMCommonManager : NSObject

+ (instancetype)sharedCommonManager;

//设置配置 resPath数据库的路径，
- (void)sdkSetConfig:(NSString *)resPath
                      maxLogSize:(NSInteger)maxLogSize
                      numLogSize:(NSInteger)numLogSize;

//初始化
- (void)sdkInitWithServerLSBURL:(NSString *)serverLSBURL
                     serverLSBPort:(NSString *)serverLSBPort
                          appId:(NSString *)appId
                        imToken:(NSString *)imToken
                        succ:(Succ)succ fail:(Fail)fail;

//添加监听者
- (void)addListener:(id<LEIGODIMCommonDelegate>)listener;
//移除监听者
- (void)removeListener:(id<LEIGODIMCommonDelegate>)listener;

@end
