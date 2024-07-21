package com.inventory.repositories.vo;

public class BookQuantity {
	private String bookCode;
	private String bookName;
	private int quantity;

	// Getters and setters

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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "BookQuantity [bookCode=" + bookCode + ", bookName=" + bookName + ", quantity=" + quantity + "]";
	}
	
}
