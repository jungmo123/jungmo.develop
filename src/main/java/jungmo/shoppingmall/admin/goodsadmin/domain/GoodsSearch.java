package jungmo.shoppingmall.admin.goodsadmin.domain;


public class GoodsSearch {
	private String SearchBar;
	private String title;
	private String sdate;
	private String edate;
	private String minPrice;
	private String maxPrice;
	private String category;
	private String displayType;
	
	public GoodsSearch(){}

	public GoodsSearch(String searchBar, String title, String sdate,
			String edate, String minPrice, String maxPrice, String category,
			String displayType) {
		SearchBar = searchBar;
		this.title = title;
		this.sdate = sdate;
		this.edate = edate;
		this.minPrice = minPrice;
		this.maxPrice = maxPrice;
		this.category = category;
		this.displayType = displayType;
	}

	public String getSdate() {
		return sdate;
	}
	public String getEdate() {
		return edate;
	}
	public String getMinPrice() {
		return minPrice;
	}
	public String getMaxPrice() {
		return maxPrice;
	}
	public String getCategory() {
		return category;
	}
	public String getDisplayType() {
		return displayType;
	}
	public void setSdate(String sdate) {
		this.sdate = sdate;
	}
	public void setEdate(String edate) {
		this.edate = edate;
	}
	public void setMinPrice(String minPrice) {
		this.minPrice = minPrice;
	}
	public void setMaxPrice(String maxPrice) {
		this.maxPrice = maxPrice;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public void setDisplayType(String displayType) {
		this.displayType = displayType;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSearchBar() {
		return SearchBar;
	}
	public void setSearchBar(String searchBar) {
		SearchBar = searchBar;
	}
}
