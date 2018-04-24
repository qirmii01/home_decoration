package com.hd.domain;

import java.util.List;

/**
 * 设计师信息对象
 */
public class DesignerInfo extends Designer {

	private static final long serialVersionUID = 1L;
	
	private String headerImg;
	
	private String userName;
	
	private String serviceAddress;
	
	private String introduce;
	
	private String record;
	
	private String designNumber;

	private Integer dataCount;
	
	private List<DesignerStyleInfo> designerStyles;

	public String getHeaderImg() {
		return headerImg;
	}

	public void setHeaderImg(String headerImg) {
		this.headerImg = headerImg;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getServiceAddress() {
		return serviceAddress;
	}

	public void setServiceAddress(String serviceAddress) {
		this.serviceAddress = serviceAddress;
	}

	public String getIntroduce() {
		return introduce;
	}

	public void setIntroduce(String introduce) {
		this.introduce = introduce;
	}

	public String getRecord() {
		return record;
	}

	public void setRecord(String record) {
		this.record = record;
	}

	public String getDesignNumber() {
		return designNumber;
	}

	public void setDesignNumber(String designNumber) {
		this.designNumber = designNumber;
	}

	public Integer getDataCount() {
		return dataCount;
	}

	public void setDataCount(Integer dataCount) {
		this.dataCount = dataCount;
	}

	public List<DesignerStyleInfo> getDesignerStyles() {
		return designerStyles;
	}

	public void setDesignerStyles(List<DesignerStyleInfo> designerStyles) {
		this.designerStyles = designerStyles;
	}

}
