package jungmo.shoppingmall.user.login.domain;

import java.sql.*;

public class User {
	private String userId;
	private String userName;
	private String userPwd;
	private String userEmail;
	private String userPhone;
	private String userPostcode;
	private String userStreet;
	private String userDetailArea;
	private int userLevel;
	private int userHp;
	private Date userJoinDate;
	private String userMailAgreement;
	private int userVisitCnt;
	private Date userLatestDate;
	private int purchaseAmount;
	private Date scdDate;
	private int scdcCode;
	private String scdType;
	private String scdContent;
	private Date dueDate;
	private int dDay;

	public User() {}
	
	// 로그인 체크
	public User(String userId,String userPwd){
		this.userId = userId;
		this.userPwd = userPwd;
	}
	
	// 회원 가입
	public User(String userId, String userName, String userPwd,
			String userEmail, String userPhone, String userPostcode,
			String userStreet, String userDetailArea,String userMailAgreement) {
		this.userId = userId;
		this.userName = userName;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userPostcode = userPostcode;
		this.userStreet = userStreet;
		this.userDetailArea = userDetailArea;
		this.userMailAgreement = userMailAgreement;
	}	

	// 회원 정보 수정1
	public User(String userEmail, String userPhone, String userPostcode,
			String userStreet, String userDetailArea) {
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userPostcode = userPostcode;
		this.userStreet = userStreet;
		this.userDetailArea = userDetailArea;
	}
	
	// 회원 정보 수정2
	public User(String userId,String userEmail, String userPhone,String userMailAgreement) {
		this.userId = userId;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userMailAgreement = userMailAgreement;
	}
	
	//관리자 회원 정보 수정
	public User(String userId,String userPwd, String userEmail, String userPhone,
			String userPostcode, String userStreet, String userDetailArea,
			int userLevel) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userEmail = userEmail;
		this.userPhone = userPhone;
		this.userPostcode = userPostcode;
		this.userStreet = userStreet;
		this.userDetailArea = userDetailArea;
		this.userLevel = userLevel;
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

	public String getUserPhone() {
		return userPhone;
	}

	public String getUserDetailArea() {
		return userDetailArea;
	}

	public String getUserPostcode() {
		return userPostcode;
	}

	public String getUserStreet() {
		return userStreet;
	}

	public void setUserPostcode(String userPostcode) {
		this.userPostcode = userPostcode;
	}

	public void setUserStreet(String userStreet) {
		this.userStreet = userStreet;
	}

	public int getUserLevel() {
		return userLevel;
	}

	public Date getUserJoinDate() {
		return userJoinDate;
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

	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
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

	public void setUserMailAgreement(String userMailAgreement) {
		this.userMailAgreement = userMailAgreement;
	}

	public void setUserVisitCnt(int userVisitCnt) {
		this.userVisitCnt = userVisitCnt;
	}

	public void setUserLatestDate(Date userLatestDate) {
		this.userLatestDate = userLatestDate;
	}

	public int getPurchaseAmount() {
		return purchaseAmount;
	}

	public void setPurchaseAmount(int purchaseAmount) {
		this.purchaseAmount = purchaseAmount;
	}

	public int getUserHp() {
		return userHp;
	}

	public void setUserHp(int userHp) {
		this.userHp = userHp;
	}

	public Date getScdDate() {
		return scdDate;
	}

	public int getScdcCode() {
		return scdcCode;
	}

	public String getScdContent() {
		return scdContent;
	}

	public void setScdDate(Date scdDate) {
		this.scdDate = scdDate;
	}

	public void setScdcCode(int scdcCode) {
		this.scdcCode = scdcCode;
	}

	public void setScdContent(String scdContent) {
		this.scdContent = scdContent;
	}

	public Date getDueDate() {
		return dueDate;
	}

	public int getdDay() {
		return dDay;
	}

	public void setDueDate(Date dueDate) {
		this.dueDate = dueDate;
	}

	public void setdDay(int dDay) {
		this.dDay = dDay;
	}

	public String getScdType() {
		return scdType;
	}

	public void setScdType(String scdType) {
		this.scdType = scdType;
	}
}
