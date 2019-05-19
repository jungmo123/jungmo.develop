package jungmo.shoppingmall.admin.user.domain;

public class UserSearch {
	private String title;
	private String SearchBar;
	private String sdate;
	private String edate;
	private String userLevel;
	private String minPrice;
	private String maxPrice;
	private String minSaved;
	private String maxSaved;
	private String email;
	private String userState;
	
	public UserSearch(){}
		
	public UserSearch(String title, String searchBar) {
		super();
		this.title = title;
		SearchBar = searchBar;
	}

	public UserSearch(String title, String searchBar, String sdate,
			String edate, String userLevel, String minPrice, String maxPrice,
			String minSaved, String maxSaved, String email,String userState) {
		this.title = title;
		SearchBar = searchBar;
		this.sdate = sdate;
		this.edate = edate;
		this.userLevel = userLevel;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.minSaved = minSaved;
		this.maxSaved = maxSaved;
		this.email = email;
		this.userState = userState;
	}
	public String getTitle() {
		return title;
	}
	public String getSearchBar() {
		return SearchBar;
	}
	public String getSdate() {
		return sdate;
	}
	public String getEdate() {
		return edate;
	}
	public String getUserLevel() {
		return userLevel;
	}
	public String getMinPrice() {
		return minPrice;
	}
	public String getMaxPrice() {
		return maxPrice;
	}
	public String getMinSaved() {
		return minSaved;
	}
	public String getMaxSaved() {
		return maxSaved;
	}
	public String getEmail() {
		return email;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public void setSearchBar(String searchBar) {
		SearchBar = searchBar;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public void setUserLevel(String userLevel) {
		this.userLevel = userLevel;
	}
	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}
	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}
	public void setMinSaved(String minSaved) {
		this.minSaved = minSaved;
	}
	public void setMaxSaved(String maxSaved) {
		this.maxSaved = maxSaved;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getUserState() {
		return userState;
	}
	public void setUserState(String userState) {
		this.userState = userState;
	}
}
