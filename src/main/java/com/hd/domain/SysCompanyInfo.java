package com.hd.domain;

public class SysCompanyInfo extends SysCompanyWithBLOBs{
	private static final long serialVersionUID = 1L;
	private String bannerImg;
	private String logoImg;
	private String qualificationsImg;
	private String bannerPath;
	private String logoPath;
	private String qualifPath;
	
	public String getBannerImg() {
		return bannerImg;
	}
	public void setBannerImg(String bannerImg) {
		this.bannerImg = bannerImg;
	}
	public String getLogoImg() {
		return logoImg;
	}
	public void setLogoImg(String logoImg) {
		this.logoImg = logoImg;
	}
	public String getQualificationsImg() {
		return qualificationsImg;
	}
	public void setQualificationsImg(String qualificationsImg) {
		this.qualificationsImg = qualificationsImg;
	}
	public String getBannerPath() {
		return bannerPath;
	}
	public void setBannerPath(String bannerPath) {
		this.bannerPath = bannerPath;
	}
	public String getLogoPath() {
		return logoPath;
	}
	public void setLogoPath(String logoPath) {
		this.logoPath = logoPath;
	}
	public String getQualifPath() {
		return qualifPath;
	}
	public void setQualifPath(String qualifPath) {
		this.qualifPath = qualifPath;
	}
}
