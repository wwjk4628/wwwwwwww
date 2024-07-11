package com.inventory.repositories.vo;

import java.util.Date;

public class OrderCheckVo {

	private String orderId;
	private String bookCode;
	private String branchId;
	private Integer quantity;
	private Date orderDate;
	private String checked;
	private String bookName;
	
	public OrderCheckVo () {
		
	}
	
	// 전체 생성자, detail 확인용.
	public OrderCheckVo(String orderId, String bookCode, String branchId, Integer quantity, Date orderDate, String checked, String bookName) {
		super();
		this.orderId = orderId;
		this.bookCode = bookCode;
		this.branchId = branchId;
		this.quantity = quantity;
		this.orderDate = orderDate;
		this.checked = checked;
		this.bookName = bookName;
	}
	
	//	오더 리스트 확인용 생성자
	public OrderCheckVo(String orderId, String branchId, Date orderDate, String checked) {
		this.orderId = orderId;
		this.branchId = branchId;
		this.orderDate = orderDate;
		this.checked = checked;
	}
	
	public OrderCheckVo (String bookCode, String branchId, Integer quantity) {
		this.bookCode = bookCode;
		this.branchId = branchId;
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

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public String getChecked() {
		return checked;
	}

	public void setChecked(String checked) {
		this.checked = checked;
	}

	@Override
	public String toString() {
		return "OrderVo [orderId=" + orderId + ", bookCode=" + bookCode + ", branchId=" + branchId + ", quantity="
				+ quantity + ", orderDate=" + orderDate + ", checked=" + checked + "]";
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
	
	
}
