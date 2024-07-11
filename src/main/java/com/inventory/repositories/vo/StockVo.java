package com.inventory.repositories.vo;

import java.util.Date;

public class StockVo {
	private int id;
	private String branchId;
	private Date date;
	private int orderId;
	private String bookCode;
	private int quantity;
	private String comments;
	private String checkedIn;
	
	public StockVo () {
		
	}

	public StockVo(int id, String branchId, Date date, int orderId, String bookCode, int quantity, String comments,
			String checkedIn) {
		this.id = id;
		this.branchId = branchId;
		this.date = date;
		this.orderId = orderId;
		this.bookCode = bookCode;
		this.quantity = quantity;
		this.comments = comments;
		this.checkedIn = checkedIn;
	}

	public StockVo(String branchId, Date date, int orderId) {
		this.branchId = branchId;
		this.date = date;
		this.orderId = orderId;
	}
	
	public StockVo(int id, String bookCode, int quantity) {
		this.quantity = quantity;
		this.id = id;
		this.bookCode = bookCode;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBranchId() {
		return branchId;
	}

	public void setBranchId(String branchId) {
		this.branchId = branchId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getOrderId() {
		return orderId;
	}

	public void setOrderId(int orderId) {
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

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}

	public String getCheckedIn() {
		return checkedIn;
	}

	public void setCheckedIn(String checkedIn) {
		this.checkedIn = checkedIn;
	}
}
