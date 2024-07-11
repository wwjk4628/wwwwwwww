package com.inventory.repositories.vo;

public class BookVo {

	private String bookCode;
	private String bookName;
	private int price;
	private String kindcode;
	
	

	public BookVo() {
		
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getKindcode() {
		return kindcode;
	}

	public void setKindcode(String kindcode) {
		this.kindcode = kindcode;
	}

	
	public BookVo(String bookCode, String bookName, int price, String kindcode) {
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.price = price;
		this.kindcode = kindcode;
	}

	public BookVo(String bookName) {
		this.bookName = bookName;
	}
	
	

}
