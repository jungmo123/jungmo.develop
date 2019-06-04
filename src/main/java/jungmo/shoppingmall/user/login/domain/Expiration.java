package jungmo.shoppingmall.user.login.domain;

import java.sql.*;

public class Expiration {
	private Date hostDate;
	private int hostDday;
	private Date domainDate;
	private int domainDday;
	
	public Expiration(){}
	
	public Expiration(Date hostDate, Date domainDate) {
		this.hostDate = hostDate;
		this.domainDate = domainDate;
	}
	
	public Date getHostDate() {
		return hostDate;
	}
	public int getHostDday() {
		return hostDday;
	}
	public Date getDomainDate() {
		return domainDate;
	}
	public int getDomainDday() {
		return domainDday;
	}
	public void setHostDate(Date hostDate) {
		this.hostDate = hostDate;
	}
	public void setHostDday(int hostDday) {
		this.hostDday = hostDday;
	}
	public void setDomainDate(Date domainDate) {
		this.domainDate = domainDate;
	}
	public void setDomainDday(int domainDday) {
		this.domainDday = domainDday;
	}
}
