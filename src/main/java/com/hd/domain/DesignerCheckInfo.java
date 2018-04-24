package com.hd.domain;

import java.math.BigDecimal;

public class DesignerCheckInfo{
	private String designerId;
	private String designerName;
	private String telphone;
	private String sex;
	private String serviceAddress;
	private String introduce;
	private String record;
	private String positionalTitle;
	private float engageTime;
	private BigDecimal designAmountLow;
	private BigDecimal designAmountHigh;
	public String getDesignerId() {
		return designerId;
	}
	public void setDesignerId(String designerId) {
		this.designerId = designerId;
	}
	public String getDesignerName() {
		return designerName;
	}
	public void setDesignerName(String designerName) {
		this.designerName = designerName;
	}
	public String getTelphone() {
		return telphone;
	}
	public void setTelphone(String telphone) {
		this.telphone = telphone;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
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
	public String getPositionalTitle() {
		return positionalTitle;
	}
	public void setPositionalTitle(String positionalTitle) {
		this.positionalTitle = positionalTitle;
	}
	public float getEngageTime() {
		return engageTime;
	}
	public void setEngageTime(float engageTime) {
		this.engageTime = engageTime;
	}
	public BigDecimal getDesignAmountLow() {
		return designAmountLow;
	}
	public void setDesignAmountLow(BigDecimal designAmountLow) {
		this.designAmountLow = designAmountLow;
	}
	public BigDecimal getDesignAmountHigh() {
		return designAmountHigh;
	}
	public void setDesignAmountHigh(BigDecimal designAmountHigh) {
		this.designAmountHigh = designAmountHigh;
	}
}
