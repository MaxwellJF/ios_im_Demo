// LEIGODIMLoginManager.mm

#import "LEIGODIMLoginManager.h"
#include "leigod-im-cross-sdk.h"

@implementation LEIGODIMLoginManager

+ (instancetype)sharedLoginManager {
    static LEIGODIMLoginManager *sharedLoginManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedLoginManager = [[self alloc] init];
    });
    return sharedLoginManager;
}

- (void)sdkLogin:(NSInteger)deviceType
          userId:(int64_t)userId
            succ:(Succ)succ
            fail:(Fail)fail {
    SdkLogin(static_cast<int>(deviceType), userId, [self, succ](std::string message) {
        dispatch_async(dispatch_get_main_queue(), ^{
            succ(@(message.c_str()));
        });
    }, [self, fail](int errorCode, std::string message) {
        dispatch_async(dispatch_get_main_queue(), ^{
            fail(errorCode, @(message.c_str()));
        });
    });
}

- (void)sdkLogout:(Succ)succ succ:(Fail)fail{
    SdkLogout(
              [self, succ](std::string message) {
                  succ(@(message.c_str()));
              },
              [self, fail](int errorCode, std::string message) {
                  fail(errorCode, @(message.c_str()));
              });
}

- (void)sdkSendMsg:(NSInteger)replyMsgId sessionId:(NSString *)sessionId msgType:(NSInteger)msgType diyType:(NSInteger)diyType bizType:(NSInteger)bizType atFlag:(NSString *)atFlag content:(NSString *)content cMsgId:(NSInteger)cMsgId extend1:(NSString *)extend1 extend2:(NSString *)extend2 extend3:(NSString *)extend3 extend4:(NSString *)extend4 extend5:(NSString *)extend5 name:(NSString *)name avatarUrl:(NSString *)avatarUrl channelId:(NSString *)channelId toName:(NSString *)toName toAvatarUrl:(NSString *)toAvatarUrl replyContent:(NSString *)replyContent succ:(Succ)succ fail:(Fail)fail {
    
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_atFlag = [atFlag UTF8String];
    std::string c_content = [content UTF8String];
    std::string c_extend1 = [extend1 UTF8String];
    std::string c_extend2 = [extend2 UTF8String];
    std::string c_extend3 = [extend3 UTF8String];
    std::string c_extend4 = [extend4 UTF8String];
    std::string c_extend5 = [extend5 UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    std::string c_channelId = [channelId UTF8String];
    std::string c_toName = [toName UTF8String];
    std::string c_toAvatarUrl = [toAvatarUrl UTF8String];
    std::string c_replyContent = [replyContent UTF8String];
    
    SdkSendMsg(static_cast<int64_t>(replyMsgId), c_sessionId, static_cast<int>(msgType), static_cast<int>(diyType), static_cast<int>(diyType), c_atFlag, c_content, static_cast<int64_t>(cMsgId), c_extend1, c_extend2, c_extend3, c_extend4, c_extend5, c_name, c_avatarUrl, c_channelId, c_toName, c_toAvatarUrl, c_replyContent, [self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

- (void)sdkHandleJoinRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    SdkHandleJoinRoom(c_sessionId, c_name, c_avatarUrl, 
                      [self, succ](std::string message) {
                          succ(@(message.c_str()));
                      },
                      [self, fail](int errorCode, std::string message) {
                          fail(errorCode, @(message.c_str()));
                      });
}

- (void)sdkCloseVoiceRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    SdkCloseVoiceRoom(c_sessionId, c_name, c_avatarUrl,
                      [self, succ](std::string message) {
                          succ(@(message.c_str()));
                      },
                      [self, fail](int errorCode, std::string message) {
                          fail(errorCode, @(message.c_str()));
                      });
}

- (void)sdkHandleRemoveERoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    SdkHandleRemoveERoom(c_sessionId, c_name, c_avatarUrl,
                         [self, succ](std::string message) {
                             succ(@(message.c_str()));
                         },
                         [self, fail](int errorCode, std::string message) {
                             fail(errorCode, @(message.c_str()));
                         });
}

-(void)sdkHandleJoinPartyRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    SdkHandleJoinPartyRoom(c_sessionId, c_name, c_avatarUrl,
                           [self, succ](std::string message) {
                               succ(@(message.c_str()));
                           },
                           [self, fail](int errorCode, std::string message) {
                               fail(errorCode, @(message.c_str()));
                           });
}

-(void)sdkClosePartyRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    SdkClosePartyRoom(c_sessionId, c_name, c_avatarUrl,
                      [self, succ](std::string message) {
                          succ(@(message.c_str()));
                      },
                      [self, fail](int errorCode, std::string message) {
                          fail(errorCode, @(message.c_str()));
                      });
}

-(void)sdkRemoveMembersPartyRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    SdkRemoveMembersPartyRoom(c_sessionId, c_name, c_avatarUrl,
                              [self, succ](std::string message) {
                                  succ(@(message.c_str()));
                              },
                              [self, fail](int errorCode, std::string message) {
                                  fail(errorCode, @(message.c_str()));
                              });
}

-(void)sdkHandleAddSubscribe:(NSString *)subscribeType subscribeUids:(NSArray *)subscribeUids succ:(Succ)succ fail:(Fail)fail{
    std::string c_subscribeType = [subscribeType UTF8String];
    NSUInteger arrSize = [subscribeUids count];
    int64_t* subscribe_uids = new int64_t[arrSize];
    int i =0;
    for(NSNumber * number in subscribeUids){
        subscribe_uids[i] = [number intValue];
        i++;
    }
    
    SdkHandleAddSubscribe(c_subscribeType, subscribe_uids, static_cast<int>(arrSize),
                          [self, succ](std::string message) {
                              succ(@(message.c_str()));
                          },
                          [self, fail](int errorCode, std::string message) {
                              fail(errorCode, @(message.c_str()));
                          });
    

    if(subscribe_uids){
        delete[] subscribe_uids;
    }
    
}

-(void)sdkHandleRemoveSubscribe:(NSString *)subscribeType subscribeUids:(NSArray *)subscribeUids succ:(Succ)succ fail:(Fail)fail{
    std::string c_subscribeType = [subscribeType UTF8String];
    NSUInteger arrSize = [subscribeUids count];
    int64_t* subscribe_uids = new int64_t[arrSize];
    int i =0;
    for(NSNumber * number in subscribeUids){
        subscribe_uids[i] = [number intValue];
        i++;
    }
    
    SdkHandleRemoveSubscribe(c_subscribeType, subscribe_uids, static_cast<int>(arrSize),
                             [self, succ](std::string message) {
                                 succ(@(message.c_str()));
                             },
                             [self, fail](int errorCode, std::string message) {
                                 fail(errorCode, @(message.c_str()));
                             });
    
    if(subscribe_uids){
        delete[] subscribe_uids;
    }
}

-(void)sdkSetMsgRead:(NSString *)sessionId bizType:(NSInteger)bizType succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    
    SdkSetMsgRead(c_sessionId, static_cast<int>(bizType),
                  [self, succ](std::string message) {
                      succ(@(message.c_str()));
                  },
                  [self, fail](int errorCode, std::string message) {
                      fail(errorCode, @(message.c_str()));
                  });
}

-(void)sdkDeleteMsg:(NSArray *)msgIds sessionId:(NSString *)sessionId name:(NSString *)name bizType:(NSInteger)bizType succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    NSUInteger arrSize = [msgIds count];
    int64_t* msg_ids = new int64_t[arrSize];
    int i =0;
    for(NSNumber * number in msgIds){
        msg_ids[i] = [number intValue];
        i++;
    }
    
    SdkDeleteMsg(msg_ids, static_cast<int>(arrSize), c_sessionId, c_name, static_cast<int>(bizType), 
                 [self, succ](std::string message) {
                     succ(@(message.c_str()));
                 },
                 [self, fail](int errorCode, std::string message) {
                     fail(errorCode, @(message.c_str()));
                 });
    
    if(msg_ids){
        delete[] msg_ids;
    }
}

-(void)sdkRevokeMsg:(NSArray *)msgIds sessionId:(NSString *)sessionId name:(NSString *)name bizType:(NSInteger)bizType succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    std::string c_name = [name UTF8String];
    NSUInteger arrSize = [msgIds count];
    int64_t* msg_ids = new int64_t[arrSize];
    int i =0;
    for(NSNumber * number in msgIds){
        msg_ids[i] = [number intValue];
        i++;
    }
    
    SdkRevokeMsg(msg_ids, static_cast<int>(arrSize), c_sessionId, c_name, static_cast<int>(bizType), 
                 [self, succ](std::string message) {
                     succ(@(message.c_str()));
                 },
                 [self, fail](int errorCode, std::string message) {
                     fail(errorCode, @(message.c_str()));
                 });
    
    if(msg_ids){
        delete[] msg_ids;
    }
}

-(void)sdkHandleCleanScreen:(NSString *)sessionId succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];
    SdkHandleCleanScreen(c_sessionId, 
                         [self, succ](std::string message) {
                             succ(@(message.c_str()));
                         },
                         [self, fail](int errorCode, std::string message) {
                             fail(errorCode, @(message.c_str()));
                         });
}

-(void)sdkSendSingleNotify:(NSArray *)tos content:(NSString *)content title:(NSString *)title msgType:(NSInteger)msgType pushContent:(NSString *)pushContent extend1:(NSString *)extend1 extend2:(NSString *)extend2 extend3:(NSString *)extend3 extend4:(NSString *)extend4 extend5:(NSString *)extend5 name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    
    NSUInteger arrSize = [tos count];
    int64_t* to_ids = new int64_t[arrSize];
    int i =0;
    for(NSNumber * number in tos){
        to_ids[i] = [number intValue];
        i++;
    }
    
    std::string c_content = [content UTF8String];
    std::string c_title = [title UTF8String];
    std::string c_pushContent = [pushContent UTF8String];
    std::string c_extend1 = [extend1 UTF8String];
    std::string c_extend2 = [extend2 UTF8String];
    std::string c_extend3 = [extend3 UTF8String];
    std::string c_extend4 = [extend4 UTF8String];
    std::string c_extend5 = [extend5 UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    INNNotifyMsg notifyMsg = {c_content,c_title,static_cast<int>(msgType),c_pushContent,c_extend1,c_extend2,c_extend3,c_extend4,c_extend5,c_name,c_avatarUrl};
    
    SdkSendSingleNotify(to_ids, static_cast<int>(arrSize), notifyMsg, 
                        [self, succ](std::string message) {
                            succ(@(message.c_str()));
                        },
                        [self, fail](int errorCode, std::string message) {
                            fail(errorCode, @(message.c_str()));
                        });
    
    if(to_ids){
        delete [] to_ids;
    }
}

-(void)sdkSendGroupNotify:(NSInteger)to content:(NSString *)content title:(NSString *)title msgType:(NSInteger)msgType pushContent:(NSString *)pushContent extend1:(NSString *)extend1 extend2:(NSString *)extend2 extend3:(NSString *)extend3 extend4:(NSString *)extend4 extend5:(NSString *)extend5 name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail{
    
    std::string c_content = [content UTF8String];
    std::string c_title = [title UTF8String];
    std::string c_pushContent = [pushContent UTF8String];
    std::string c_extend1 = [extend1 UTF8String];
    std::string c_extend2 = [extend2 UTF8String];
    std::string c_extend3 = [extend3 UTF8String];
    std::string c_extend4 = [extend4 UTF8String];
    std::string c_extend5 = [extend5 UTF8String];
    std::string c_name = [name UTF8String];
    std::string c_avatarUrl = [avatarUrl UTF8String];
    
    INNNotifyMsg notifyMsg = {c_content,c_title,static_cast<int>(msgType),c_pushContent,c_extend1,c_extend2,c_extend3,c_extend4,c_extend5,c_name,c_avatarUrl};
    
    SdkSendGroupNotify(static_cast<int64_t>(to), notifyMsg,
                       [self, succ](std::string message) {
                           succ(@(message.c_str()));
                       },
                       [self, fail](int errorCode, std::string message) {
                           fail(errorCode, @(message.c_str()));
                       });
}

-(void)sdkGetHistoryMsgList:(NSInteger)count sequence:(NSInteger)sequence essionId:(NSString *)sessionId succ:(Succ)succ fail:(Fail)fail{
    std::string c_sessionId = [sessionId UTF8String];

    SdkGetHistoryMsgList(static_cast<int64_t>(count), static_cast<int64_t>(sequence), c_sessionId, 
                         [self, succ](std::string message) {
                             succ(@(message.c_str()));
                         },
                         [self, fail](int errorCode, std::string message) {
                             fail(errorCode, @(message.c_str()));
                         });
}

-(void)sdkGetSessionList:(Succ)succ fail:(Fail)fail{
    
    SdkGetSessionList([self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

-(void)sdkSetMessageRemindType:(NSString *)sessionId isRemind:(bool)isRemind succ:(Succ)succ fail:(Fail)fail{
    std::string c_id = [sessionId UTF8String];
    
    SdkSetMessageRemindType(c_id,isRemind, [self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

-(void)sdkPinConversation:(NSString *)sessionId isRemind:(bool)isPinned succ:(Succ)succ fail:(Fail)fail{
    std::string c_id = [sessionId UTF8String];
    
    SdkPinConversation(c_id,isPinned, [self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

-(void)sdkDeleteCoversation:(NSString *)sessionId succ:(Succ)succ fail:(Fail)fail{
    std::string c_id = [sessionId UTF8String];
    
    SdkDeleteCoversation(c_id, [self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

-(void)sdkJoinGroup:(NSInteger)groupId name:(NSString *)name succ:(Succ)succ fail:(Fail)fail{
    std::string c_name = [name UTF8String];

    SdkJoinGroup(static_cast<int64_t>(groupId),c_name, [self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

-(void)sdkDisbandGroup:(NSInteger)groupId succ:(Succ)succ fail:(Fail)fail{
    SdkDisbandGroup(static_cast<int64_t>(groupId), [self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

-(void)sdkRemoveMembersGroup:(NSInteger)groupId name:(NSString *)name succ:(Succ)succ fail:(Fail)fail{
    std::string c_name = [name UTF8String];

    SdkRemoveMembersGroup(static_cast<int64_t>(groupId),c_name, 
                          [self, succ](std::string message) {
        succ(@(message.c_str()));
    },
    [self, fail](int errorCode, std::string message) {
        fail(errorCode, @(message.c_str()));
    });
}

@end
