package com.wl.model;

import java.io.Serializable;
import java.util.Date;

public class PetOwner implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -4908589260446618646L;

	private Integer id;
	private String ownerUsername;
	private String ownerPassword;
	private Integer ownerAge;
	private String ownerSex;
	private String telephone;
	private String ownerEmail;
	private String address;
	private String occupation;
	private Date createTime;
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getOwnerUsername() {
		return ownerUsername;
	}
	public void setOwnerUsername(String ownerUsername) {
		this.ownerUsername = ownerUsername;
	}
	public String getOwnerPassword() {
		return ownerPassword;
	}
	public void setOwnerPassword(String ownerPassword) {
		this.ownerPassword = ownerPassword;
	}
	public Integer getOwnerAge() {
		return ownerAge;
	}
	public void setOwnerAge(Integer ownerAge) {
		this.ownerAge = ownerAge;
	}
	public String getOwnerSex() {
		return ownerSex;
	}
	public void setOwnerSex(String ownerSex) {
		this.ownerSex = ownerSex;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public String getOwnerEmail() {
		return ownerEmail;
	}
	public void setOwnerEmail(String ownerEmail) {
		this.ownerEmail = ownerEmail;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getOccupation() {
		return occupation;
	}
	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	
	@Override
	public String toString() {
		return "PetOwner [id=" + id + ", ownerUsername=" + ownerUsername + ", ownerPassword=" + ownerPassword
				+ ", ownerAge=" + ownerAge + ", ownerSex=" + ownerSex + ", telephone=" + telephone + ", ownerEmail="
				+ ownerEmail + ", address=" + address + ", occupation=" + occupation + ", createTime=" + createTime
				+ "]";
	}
	
}
