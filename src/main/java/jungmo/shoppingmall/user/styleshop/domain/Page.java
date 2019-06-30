package jungmo.shoppingmall.user.styleshop.domain;

public class Page {
	private int currentPage;
	private int rowCnt;
	private String godcNum;
	private String type;
	private String godNum;
	private String userId;
	private String sdate;
	private String edate;
	private String otoqContent;
	private String godrContent;
	private String godqContent;
	private String godqType;
	
	public Page(){
		this(1,5);
	}

	public Page(int currentPage){
		this(currentPage,5);
	}
	
	public Page(int currentPage,int rowCnt){
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
	}
	
	public Page(int currentPage,int rowCnt,String godcNum,String type){
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
		this.godcNum = godcNum;
		this.type = type;
	}
	
	public Page(int currentPage, int rowCnt, String userId) {
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
		this.userId = userId;
	}
	
	public Page(int currentPage, int rowCnt, String userId, String sdate,
			String edate) {
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
		this.userId = userId;
		this.sdate = sdate;
		this.edate = edate;
	}
	
	public Page(int currentPage, int rowCnt, String godcNum, String userId,
			String godrContent,boolean add) {
		this.currentPage = currentPage;
		this.rowCnt = rowCnt;
		this.godcNum = godcNum;
		this.userId = userId;
		this.godrContent = godrContent;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getRowCnt() {
		return rowCnt;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public void setRowCnt(int rowCnt) {
		this.rowCnt = rowCnt;
	}

	public String getGodcNum() {
		return godcNum;
	}

	public void setGodcNum(String godcNum) {
		this.godcNum = godcNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getGodNum() {
		return godNum;
	}

	public void setGodNum(String godNum) {
		this.godNum = godNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getSdate() {
		return sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getOtoqContent() {
		return otoqContent;
	}

	public void setOtoqContent(String otoqContent) {
		this.otoqContent = otoqContent;
	}

	public String getGodrContent() {
		return godrContent;
	}

	public void setGodrContent(String godrContent) {
		this.godrContent = godrContent;
	}

	public String getGodqContent() {
		return godqContent;
	}

	public String getGodqType() {
		return godqType;
	}

	public void setGodqContent(String godqContent) {
		this.godqContent = godqContent;
	}

	public void setGodqType(String godqType) {
		this.godqType = godqType;
	}
}
