package jungmo.shoppingmall.user.login.domain;

import java.sql.*;

public class User {
	private String userId;
	private String userName;
	private String userPwd;
	private String userEmail;
	private int userPhone;
	private String userSi;
	private String userGu;
	private String userDong;
	private String userDetailArea;
	private int userLevel;
	private Date userJoinDate;
	private int userHp;
	private String userMailAgreement;
	private int userVisitCnt;
	private Date userLatestDate;

	public User() {}
	
	// 로그인 체크
	public User(String userId,String userPwd){
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	// 회원 가입
	public User(String userId, String userName, String userPwd,
			String userEmail, int userPhone, String userSi, String userGu,
			String userDong, String userDetailArea,String userMailAgreement) {
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userSi = userSi;
		this.userGu = userGu;
		this.userDong = userDong;
		this.userDetailArea = userDetailArea;
		this.userMailAgreement = userMailAgreement;
	}

	// 회원 정보 수정
	public User(String userEmail, int userPhone, String userSi, String userGu,
			String userDong, String userDetailArea) {
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userSi = userSi;
		this.userGu = userGu;
		this.userDong = userDong;
		this.userDetailArea = userDetailArea;
	}

	public String getUserId() {
		return userId;
	}

	public String getUserName() {
		return userName;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public int getUserPhone() {
		return userPhone;
	}

	public String getUserSi() {
		return userSi;
	}

	public String getUserGu() {
		return userGu;
	}

	public String getUserDong() {
		return userDong;
	}

	public String getUserDetailArea() {
		return userDetailArea;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public Date getUserJoinDate() {
		return userJoinDate;
	}

	public int getUserHp() {
		return userHp;
	}

	public String getUserMailAgreement() {
		return userMailAgreement;
	}

	public int getUserVisitCnt() {
		return userVisitCnt;
	}

	public Date getUserLatestDate() {
		return userLatestDate;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public void setUserPhone(int userPhone) {
		this.userPhone = userPhone;
	}

	public void setUserSi(String userSi) {
		this.userSi = userSi;
	}

	public void setUserGu(String userGu) {
		this.userGu = userGu;
	}

	public void setUserDong(String userDong) {
		this.userDong = userDong;
	}

	public void setUserDetailArea(String userDetailArea) {
		this.userDetailArea = userDetailArea;
	}

	public void setUserLevel(int userLevel) {
		this.userLevel = userLevel;
	}

	public void setUserJoinDate(Date userJoinDate) {
		this.userJoinDate = userJoinDate;
	}

	public void setUserHp(int userHp) {
		this.userHp = userHp;
	}

	public void setUserMailAgreement(String userMailAgreement) {
		this.userMailAgreement = userMailAgreement;
	}

	public void setUserVisitCnt(int userVisitCnt) {
		this.userVisitCnt = userVisitCnt;
	}

	public void setUserLatestDate(Date userLatestDate) {
		this.userLatestDate = userLatestDate;
	}

}
