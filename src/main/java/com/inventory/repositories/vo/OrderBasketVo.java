package com.inventory.repositories.vo;

import java.util.Date;

public class OrderBasketVo {

	private int basketId;
	private String orderId;
	private String branchId;
	private String bookCode;
	private String bookName;
	private int quantity;

	public OrderBasketVo() {

	}

	public OrderBasketVo(String bookCode, String bookName, int quantity) {

		this.bookCode = bookCode;
		this.bookName = bookName;
		this.quantity = quantity;
	}

	public OrderBasketVo(String orderId, String branchId, String bookCode, int quantity) {
		
		this.orderId = orderId;
		this.branchId = branchId;
		this.bookCode = bookCode;
		this.quantity = quantity;
	}

	public OrderBasketVo(int basketId, String orderId, String branchId, String bookCode, String bookName,
			int quantity) {

		this.basketId = basketId;
		this.orderId = orderId;
		this.branchId = branchId;
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.quantity = quantity;
	}

	public int getBasketId() {
		return basketId;
	}

	public void setBasketId(int basketId) {
		this.basketId = basketId;
	}

	public String getOrderId() {
		return orderId;
	}

	public void setOrderId(String orderId) {
		this.orderId = orderId;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
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

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderBasketVo [basketId=" + basketId + ", orderId=" + orderId + ", branchId=" + branchId
				+ ", bookCode=" + bookCode + ", bookName=" + bookName + ", quantity=" + quantity + "]";
	}

}