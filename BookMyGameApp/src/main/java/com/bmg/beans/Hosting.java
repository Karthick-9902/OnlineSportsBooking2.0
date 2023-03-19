package com.bmg.beans;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bmg.compositekey.HostKey;
@Entity
@Table(name = "hostinginfo")
public class Hosting  implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	private HostKey hostKey;
	private String hostMail;
	private String status;

	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public String getHostMail() {
		return hostMail;
	}
	@Override
	public String toString() {
		return "Hosting [hostKey=" + hostKey + ", hostMail=" + hostMail + ", status=" + status + "]";
	}
	public void setHostMail(String hostMail) {
		this.hostMail = hostMail;
	}
	public HostKey getHostKey() {
		return hostKey;
	}
	public void setHostKey(HostKey hostKey) {
		this.hostKey = hostKey;
	}


}
