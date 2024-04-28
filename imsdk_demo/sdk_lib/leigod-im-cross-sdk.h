#pragma once
#include <string>
#include <functional>

//typedef struct {
//	const char* str;
//	size_t len;
//} string_t;

#ifdef _WIN32
#ifdef IM_SDK_EXPORTS
#define LEIGOD_IM_SDK_API __declspec(dllexport)
#else
#define LEIGOD_IM_SDK_API __declspec(dllimport)
#endif
#else
#define LEIGOD_IM_SDK_API
#endif

struct INNNotifyMsg {
	std::string content;
	std::string title;
	int msgType;
	std::string pushContent;
	std::string extend1;
	std::string extend2;
	std::string extend3;
	std::string extend4;
	std::string extend5;
	std::string name;
	std::string avatarUrl;
};

//��Ϣ�ص�
typedef void(*MSGCALLBACK)(const std::string& received_msg, void* user_data);

//֪ͨ�ص�
typedef void(*NOTIFYCALLBACK)(const std::string& notify_msg, void* user_data);

//�����¼�
typedef void(*EVENTCALLBACK)(const std::string& event_msg, void* user_data);

//sdk�����޸�
LEIGOD_IM_SDK_API void SdkSetConfig(const std::string& res_path, uint32_t max_log_size, uint32_t num_log_files);

//��ʼ��
LEIGOD_IM_SDK_API void SdkInit(const std::string& server_lsb_url, const std::string& server_lsb_port, const std::string& app_id, const std::string& im_token, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure, MSGCALLBACK msg_callback, NOTIFYCALLBACK notify_callback, EVENTCALLBACK event_callback, void* user_data);

LEIGOD_IM_SDK_API void SdkLogin(const int& device_type, const int64_t& user_id, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
//�˳���¼
LEIGOD_IM_SDK_API void SdkLogout(std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

//����Ϣ
LEIGOD_IM_SDK_API void SdkSendMsg(const int64_t& replyMsgId, const std::string& sessionId, const int& msgType, const int& diyType, const int& bizType, const std::string& atFlag, const std::string& content, const int64_t& cMsgId,
    const std::string& extend1, const std::string& extend2, const std::string& extend3, const std::string& extend4, const std::string& extend5, const std::string& name, const std::string& avatarUrl, const std::string& channelId,
    const std::string& toName, const std::string& toAvatarUrl, const std::string& replyContent, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

//ֱ�������
LEIGOD_IM_SDK_API void SdkHandleJoinRoom(const std::string& session_id, const std::string& name, const std::string& avatarUrl, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkCloseVoiceRoom(const std::string& session_id, const std::string& name, const std::string& avatarUrl, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkHandleRemoveERoom(const std::string& session_id, const std::string& name, const std::string& avatarUrl, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

//�ɶԷ����
LEIGOD_IM_SDK_API void SdkHandleJoinPartyRoom(const std::string& session_id, const std::string& name, const std::string& avatarUrl, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkClosePartyRoom(const std::string& session_id, const std::string& name, const std::string& avatarUrl, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkRemoveMembersPartyRoom(const std::string& session_id, const std::string& name, const std::string& avatarUrl, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

//���ġ�ȡ������
LEIGOD_IM_SDK_API void SdkHandleAddSubscribe(const std::string& subscribe_type, int64_t subscribe_uids[], const int& subscribe_uids_cnt, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkHandleRemoveSubscribe(const std::string& subscribe_type, int64_t subscribe_uids[], const int& subscribe_uids_cnt, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

//��Ϣ�������
LEIGOD_IM_SDK_API void SdkSetMsgRead(const std::string& session_id, int biz_type, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkDeleteMsg(const int64_t msg_id[], const int& msg_id_size, const std::string& session_id, const std::string& name, const int& business_type, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkRevokeMsg(const int64_t msg_id[], const int& msg_id_size, const std::string& session_id, const std::string& name, const int& business_type, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

//����
LEIGOD_IM_SDK_API void SdkHandleCleanScreen(const std::string& session_id, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

//����֪ͨ���
LEIGOD_IM_SDK_API void SdkSendSingleNotify(const int64_t tos[], const int& tos_size, const INNNotifyMsg& notifyMsg, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);
LEIGOD_IM_SDK_API void SdkSendGroupNotify(const int64_t& to, const INNNotifyMsg& notifyMsg, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);

LEIGOD_IM_SDK_API void SdkGetHistoryMsgList(const int64_t& count, const int64_t& sequence, const std::string& session_id, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//��ȡ�Ự��ʷ��Ϣ
LEIGOD_IM_SDK_API void SdkGetSessionList(std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//��ȡ�û��Ự�б�
LEIGOD_IM_SDK_API void SdkSetMessageRemindType(const std::string& id, const bool& isRemind, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//��Ϣ�����
LEIGOD_IM_SDK_API void SdkPinConversation(const std::string& id, const bool& isPinned, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//�Ự�ö�
LEIGOD_IM_SDK_API void SdkDeleteCoversation(const std::string& id, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//ɾ���Ự

//Ⱥ�����
LEIGOD_IM_SDK_API void SdkJoinGroup(const int64_t& group_id, const std::string& name, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//��Ⱥ
LEIGOD_IM_SDK_API void SdkDisbandGroup(const int64_t& group_id, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//��ɢȺ
LEIGOD_IM_SDK_API void SdkRemoveMembersGroup(const int64_t& group_id, const std::string& name, std::function<void(std::string)> on_success, std::function<void(int, std::string)> on_failure);//��Ⱥ
