package com.ssafy.fit.model.dto;

public class Video {

	private String id;
	private String title;
	private String thumbUrl;
	private int viewCnt;
	private String category;

	public Video() {

	}

	public Video(String id, String title, String thumbUrl, int viewCnt, String category) {
		super();
		this.id = id;
		this.title = title;
		this.thumbUrl = thumbUrl;
		this.viewCnt = viewCnt;
		this.category = category;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getThumbUrl() {
		return thumbUrl;
	}

	public void setThumbUrl(String thumbUrl) {
		this.thumbUrl = thumbUrl;
	}

	public int getViewCnt() {
		return viewCnt;
	}

	public void setViewCnt(int viewCnt) {
		this.viewCnt = viewCnt;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	@Override
	public String toString() {
		return "Video [id=" + id + ", title=" + title + ", thumbUrl=" + thumbUrl + ", viewCnt=" + viewCnt
				+ ", category=" + category + "]";
	}

}
