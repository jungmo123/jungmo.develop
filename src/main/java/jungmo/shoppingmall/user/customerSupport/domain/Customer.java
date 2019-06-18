package jungmo.shoppingmall.user.customerSupport.domain;

public class Customer {
	private String userName;
	private String userId;
	private String email;
	private String userPwd;
	
	public Customer(){}
	
	public Customer(String userName, String userId, String email) {
		this.userName = userName;
		this.userId = userId;
		this.email = email;
	}

	public Customer(String userName, String email) {
		this.userName = userName;
		this.email = email;
	}

	public Customer(String userId, String userPwd,int idx) {
		this.userId = userId;
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}
	public String getUserId() {
		return userId;
	}
	public String getEmail() {
		return email;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserPwd() {
		return userPwd;
	}
	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}
}
