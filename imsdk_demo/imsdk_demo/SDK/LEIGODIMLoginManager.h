// LEIGODIMLoginManager.h

#import <Foundation/Foundation.h>
#import "LEIGODIMCommonDelegate.h"

@interface LEIGODIMLoginManager : NSObject

+ (instancetype)sharedLoginManager;

//登录
- (void)sdkLogin:(NSInteger)deviceType userId:(int64_t)userId succ:(Succ)succ fail:(Fail)fail;

//登出
- (void)sdkLogout:(Succ)succ fail:(Fail)fail;

//发消息
- (void)sdkSendMsg:(NSInteger)replyMsgId sessionId:(NSString *)sessionId msgType:(NSInteger)msgType diyType:(NSInteger)diyType bizType:(NSInteger)bizType atFlag:(NSString *)atFlag content:(NSString *)content cMsgId:(NSInteger)cMsgId extend1:(NSString *)extend1 extend2:(NSString *)extend2 extend3:(NSString *)extend3 extend4:(NSString *)extend4 extend5:(NSString *)extend5 name:(NSString *)name avatarUrl:(NSString *)avatarUrl channelId:(NSString *)channelId toName:(NSString *)toName toAvatarUrl:(NSString *)toAvatarUrl replyContent:(NSString *)replyContent succ:(Succ)succ fail:(Fail)fail;

//加入直播间
- (void)sdkHandleJoinRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;
//关闭直播间
- (void)sdkCloseVoiceRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;
//退出直播间
- (void)sdkHandleRemoveERoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;

//加入派对房
-(void)sdkHandleJoinPartyRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;
//关闭派对房
-(void)sdkClosePartyRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;
//退出派对房
-(void)sdkRemoveMembersPartyRoom:(NSString *)sessionId name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;

//添加订阅
-(void)sdkHandleAddSubscribe:(NSString *)subscribeType subscribeUids:(NSArray *)subscribeUids succ:(Succ)succ fail:(Fail)fail;
//移除订阅
-(void)sdkHandleRemoveSubscribe:(NSString *)subscribeType subscribeUids:(NSArray *)subscribeUids succ:(Succ)succ fail:(Fail)fail;

//消息已读
-(void)sdkSetMsgRead:(NSString *)sessionId bizType:(NSInteger)bizType succ:(Succ)succ fail:(Fail)fail;
//删除消息
-(void)sdkDeleteMsg:(NSArray *)msgIds sessionId:(NSString *)sessionId name:(NSString *)name bizType:(NSInteger)bizType succ:(Succ)succ fail:(Fail)fail;
//撤回消息
-(void)sdkRevokeMsg:(NSArray *)msgIds sessionId:(NSString *)sessionId name:(NSString *)name bizType:(NSInteger)bizType succ:(Succ)succ fail:(Fail)fail;

//清屏
-(void)sdkHandleCleanScreen:(NSString *)sessionId succ:(Succ)succ fail:(Fail)fail;

//单聊通知
-(void)sdkSendSingleNotify:(NSArray *)tos content:(NSString *)content title:(NSString *)title msgType:(NSInteger)msgType pushContent:(NSString *)pushContent extend1:(NSString *)extend1 extend2:(NSString *)extend2 extend3:(NSString *)extend3 extend4:(NSString *)extend4 extend5:(NSString *)extend5 name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;

//群聊通知
-(void)sdkSendGroupNotify:(NSInteger)to content:(NSString *)content title:(NSString *)title msgType:(NSInteger)msgType pushContent:(NSString *)pushContent extend1:(NSString *)extend1 extend2:(NSString *)extend2 extend3:(NSString *)extend3 extend4:(NSString *)extend4 extend5:(NSString *)extend5 name:(NSString *)name avatarUrl:(NSString *)avatarUrl succ:(Succ)succ fail:(Fail)fail;

//获取历史消息列表
-(void)sdkGetHistoryMsgList:(NSInteger)count sequence:(NSInteger)sequence essionId:(NSString *)sessionId succ:(Succ)succ fail:(Fail)fail;

//获取会话列表
-(void)sdkGetSessionList:(Succ)succ fail:(Fail)fail;

//设置消息免打扰
-(void)sdkSetMessageRemindType:(NSString *)sessionId isRemind:(bool)isRemind succ:(Succ)succ fail:(Fail)fail;

//会话置顶
-(void)sdkPinConversation:(NSString *)sessionId isRemind:(bool)isPinned succ:(Succ)succ fail:(Fail)fail;

//删除会话
-(void)sdkDeleteCoversation:(NSString *)sessionId succ:(Succ)succ fail:(Fail)fail;

//加入群聊
-(void)sdkJoinGroup:(NSInteger)groupId name:(NSString *)name succ:(Succ)succ fail:(Fail)fail;

//解散群聊
-(void)sdkDisbandGroup:(NSInteger)groupId succ:(Succ)succ fail:(Fail)fail;

//退出群聊
-(void)sdkRemoveMembersGroup:(NSInteger)groupId name:(NSString *)name succ:(Succ)succ fail:(Fail)fail;

@end
