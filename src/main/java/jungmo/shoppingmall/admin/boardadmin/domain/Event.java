package jungmo.shoppingmall.admin.boardadmin.domain;

import java.sql.*;

public class Event {
	private int eventNum;
	private String eventTitle;
	private String eventSummary;
	private String eventContent;
	private Date eventSDate;
	private Date eventEDate;
	private String eventListImageUrl;
	private int eventViewCnt;
	private int nextNum;
	private int preNum;
	private String sd;
	private String ed;
	
	public Event(){}

	public Event(String eventTitle, String eventSummary,
			String eventContent, String eventListImageUrl, int eventViewCnt,
			String sd, String ed) {
		this.eventTitle = eventTitle;
		this.eventSummary = eventSummary;
		this.eventContent = eventContent;
		this.eventListImageUrl = eventListImageUrl;
		this.eventViewCnt = eventViewCnt;
		this.sd = sd;
		this.ed = ed;
	}

	public int getEventNum() {
		return eventNum;
	}
	public String getEventSummary() {
		return eventSummary;
	}
	public String getEventContent() {
		return eventContent;
	}
	public Date getEventSDate() {
		return eventSDate;
	}
	public Date getEventEDate() {
		return eventEDate;
	}
	public String getEventListImageUrl() {
		return eventListImageUrl;
	}
	public int getEventViewCnt() {
		return eventViewCnt;
	}
	public void setEventNum(int eventNum) {
		this.eventNum = eventNum;
	}
	public void setEventSummary(String eventSummary) {
		this.eventSummary = eventSummary;
	}
	public void setEventContent(String eventContent) {
		this.eventContent = eventContent;
	}
	public void setEventSDate(Date eventSDate) {
		this.eventSDate = eventSDate;
	}
	public void setEventEDate(Date eventEDate) {
		this.eventEDate = eventEDate;
	}
	public void setEventListImageUrl(String eventListImageUrl) {
		this.eventListImageUrl = eventListImageUrl;
	}
	public void setEventViewCnt(int eventViewCnt) {
		this.eventViewCnt = eventViewCnt;
	}
	public String getEventTitle() {
		return eventTitle;
	}
	public void setEventTitle(String eventTitle) {
		this.eventTitle = eventTitle;
	}
	public int getNextNum() {
		return nextNum;
	}
	public int getPreNum() {
		return preNum;
	}
	public void setNextNum(int nextNum) {
		this.nextNum = nextNum;
	}
	public void setPreNum(int preNum) {
		this.preNum = preNum;
	}

	public String getSd() {
		return sd;
	}

	public String getEd() {
		return ed;
	}

	public void setSd(String sd) {
		this.sd = sd;
	}

	public void setEd(String ed) {
		this.ed = ed;
	}
}
