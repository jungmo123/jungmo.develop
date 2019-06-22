package jungmo.shoppingmall.user.mypage.domain;

public class ImageList {
	private String imageUrl;
	private String excNum;
	
	public ImageList(){}
	
	public ImageList(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getExcNum() {
		return excNum;
	}
	public void setExcNum(String excNum) {
		this.excNum = excNum;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}
	
}
