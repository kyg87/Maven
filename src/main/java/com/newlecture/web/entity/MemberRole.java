package com.newlecture.web.entity;

import java.sql.Date;

public class MemberRole {

	private String memberId;
	private String roleId;
	private String regAdmin;
	private Date regDate;
	private boolean defaultRole;
	
	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getRoleId() {
		return roleId;
	}

	public void setRoleId(String roleId) {
		this.roleId = roleId;
	}

	public String getRegAdmin() {
		return regAdmin;
	}

	public void setRegAdmin(String regAdmin) {
		this.regAdmin = regAdmin;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public boolean isDefaultRole() {
		return defaultRole;
	}

	public void setDefaultRole(boolean defaultRole) {
		this.defaultRole = defaultRole;
	}



}