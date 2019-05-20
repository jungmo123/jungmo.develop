package jungmo.shoppingmall.admin.user.service;

import java.util.*;

import jungmo.shoppingmall.admin.order.domain.*;
import jungmo.shoppingmall.admin.user.domain.*;
import jungmo.shoppingmall.user.join.domain.*;
import jungmo.shoppingmall.user.login.domain.*;

public interface UserService {
	List<User> getUsers(Page page);
	List<User> getLeaveUsers(Page page);
	int userStateChange(HashMap<String,List<String>> map);
	int addLeaveUser(HashMap<String,List<String>> map);
	List<User> getSearchUsers(Page page);
	List<User> getLeaveSearchUsers(Page page);
	User getUser(String userId);
	List<Loglog> getLoglog(String userId);
	List<PurchaseList> getPurl(String userId);
	List<PointLogs> getPointLogs(String userId);
	int addPoint(PointLogs pl);
	List<ClauseCategory> getClauses(String userId);
	int updateUserInfo(User user);
	int updateUserState(String userId);
	int SearchAddPoint(Page page);
	int deleteUser(HashMap<String,List<String>> map);
	MailForm getMailForm(String mailType);
	int updateMailForm(MailForm mailForm);
	List<SmsForm> getSmsForms();
	int updateSmsForm(SmsForm sms);
	SmsForm getSmsForm(int smsNum);
	List<User> SearchMailUser(UserSearch us);
}
