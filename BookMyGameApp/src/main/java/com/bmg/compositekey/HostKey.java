package com.bmg.compositekey;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Embeddable;
@Embeddable
public class HostKey implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fname;
	private LocalDate bdate;
	private String userMail;
	
	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public LocalDate getBdate() {
		return bdate;
	}

	public void setBdate(LocalDate bdate) {
		this.bdate = bdate;
	}

	public String getUserMail() {
		return userMail;
	}

	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}

	@Override
	public String toString() {
		return "HostKey [fname=" + fname + ", bdate=" + bdate + ", userMail=" + userMail + "]";
	}
}
