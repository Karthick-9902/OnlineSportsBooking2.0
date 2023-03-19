package com.bmg.compositekey;

import java.io.Serializable;
import java.time.LocalDate;

import javax.persistence.Embeddable;

@Embeddable
public class BookKey implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private String fname;
	private LocalDate bookDate;
	@Override
	public String toString() {
		return "BookKey [fname=" + fname + ", bookDate=" + bookDate + "]";
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public LocalDate getBookDate() {
		return bookDate;
	}
	public void setBookDate(LocalDate bookDate) {
		this.bookDate = bookDate;
	}


	
}
