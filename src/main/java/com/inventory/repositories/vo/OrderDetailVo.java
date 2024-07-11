package com.inventory.repositories.vo;

public class OrderDetailVo {

	private String orderId;
	private String bookCode;
	private String bookName;
	private int price;
	private int quantity;

	public OrderDetailVo() {

	}

	public OrderDetailVo(String orderId) {

		this.orderId = orderId;
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

	public OrderDetailVo(String orderId, String bookCode, int quantity) {

		this.orderId = orderId;
		this.bookCode = bookCode;
		this.quantity = quantity;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getBookCode() {
		return bookCode;
	}

	public void setBookCode(String bookCode) {
		this.bookCode = bookCode;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderDetailVo [orderId=" + orderId + ", bookCode=" + bookCode + ", bookName=" + bookName + ", price="
				+ price + ", quantity=" + quantity + "]";
	}

}
