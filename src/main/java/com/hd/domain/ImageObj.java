package com.hd.domain;

public class ImageObj {
	private String src;

	/** layui富文本 **/
	private String title;
	
	/** layer photos */
	//图片名
	private String alt;
	//图片id
	private String pid;
	//缩略图地址
	private String thumb;
	
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getSrc() {
		return src;
	}
	public void setSrc(String src) {
		this.src = src;
	}
	public String getAlt() {
		return alt;
	}
	public void setAlt(String alt) {
		this.alt = alt;
	}
	public String getpid() {
		return pid;
	}
	public void setpid(String pid) {
		this.pid = pid;
	}
	public String getThumb() {
		return thumb;
	}
	public void setThumb(String thumb) {
		this.thumb = thumb;
	}
}
