package jungmo.shoppingmall.admin.user.domain;

public class MailForm {
	private String mailType;
	private String automaticallySend;
	private String mailTitle;
	private String mailContent;
	
	public MailForm(){}
	
	public MailForm(String mailType, String automaticallySend,
			String mailTitle, String mailContent) {
		this.mailType = mailType;
		this.automaticallySend = automaticallySend;
		this.mailTitle = mailTitle;
		this.mailContent = mailContent;
	}

	public String getMailType() {
		return mailType;
	}
	public String getAutomaticallySend() {
		return automaticallySend;
	}
	public String getMailTitle() {
		return mailTitle;
	}
	public String getMailContent() {
		return mailContent;
	}
	public void setMailType(String mailType) {
		this.mailType = mailType;
	}
	public void setAutomaticallySend(String automaticallySend) {
		this.automaticallySend = automaticallySend;
	}
	public void setMailTitle(String mailTitle) {
		this.mailTitle = mailTitle;
	}
	public void setMailContent(String mailContent) {
		this.mailContent = mailContent;
	}
}
