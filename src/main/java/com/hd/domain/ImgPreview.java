package com.hd.domain;

import java.util.List;

/**
 * 图片预览
 */
public class ImgPreview {
	private String title;
	private String id;
	private Integer start = 0;
	private List<ImageObj> imageObjs;
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Integer getStart() {
		return start;
	}
	public void setStart(Integer start) {
		this.start = start;
	}
	public List<ImageObj> getImageObjs() {
		return imageObjs;
	}
	public void setImageObjs(List<ImageObj> imageObjs) {
		this.imageObjs = imageObjs;
	}
	
}
