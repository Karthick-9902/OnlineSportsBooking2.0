package com.bmg.beans;

import java.io.Serializable;

import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.Table;

import com.bmg.compositekey.BookKey;
@Entity
@Table(name = "Bookings")
public class Booking implements Serializable {
/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@EmbeddedId
	private BookKey bookKey;
	private String bookType;
	private String userMail;


	public BookKey getBookKey() {
		return bookKey;
	}
	public void setBookKey(BookKey bookKey) {
		this.bookKey = bookKey;
	}
	public String getUserMail() {
		return userMail;
	}
	public void setUserMail(String userMail) {
		this.userMail = userMail;
	}
	public String getBookType() {
		return bookType;
	}
	public void setBookType(String bookType) {
		this.bookType = bookType;
	}
	@Override
	public String toString() {
		return "Booking [bookKey=" + bookKey + ", bookType=" + bookType + ", userMail=" + userMail + "]";
	}
	

}
