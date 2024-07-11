package com.inventory.repositories.vo;

public class OrderDetailVo {

	private String orderId;
	private String bookCode;
	private int quantity;

	public OrderDetailVo() {

	}

	public OrderDetailVo(String orderId) {

		this.orderId = orderId;
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
		return "OrderDetailVo [orderId=" + orderId + ", bookCode=" + bookCode + ", quantity=" + quantity + "]";
	}

}
