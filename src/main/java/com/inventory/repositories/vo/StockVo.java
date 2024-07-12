package com.inventory.repositories.vo;

import java.util.Date;

public class StockVo {
	private int id;
	private String branchId;
	private Date flucDate;
	private int orderId;
	private String bookCode;
	private int quantity;
	private String comments;
	private String checkedIn;
	private String bookName;
	
	public StockVo () {
		
	}

	public StockVo(int id, String branchId, Date flucDate, int orderId, String bookCode, int quantity, String comments,
			String checkedIn, String bookName) {
		this.id = id;
		this.branchId = branchId;
		this.flucDate = flucDate;
		this.orderId = orderId;
		this.bookCode = bookCode;
		this.quantity = quantity;
		this.comments = comments;
		this.checkedIn = checkedIn;
		this.bookName = bookName;
	}

	public StockVo(int id, String branchId, Date flucDate, int orderId, String checkedIn) {
		super();
		this.id = id;
		this.branchId = branchId;
		this.flucDate = flucDate;
		this.orderId = orderId;
		this.checkedIn = checkedIn;
	}

	public StockVo(String branchId, Date flucDate, int orderId) {
		this.branchId = branchId;
		this.flucDate = flucDate;
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

	public Date getFlucDate() {
		return flucDate;
	}

	public void setFlucDate(Date flucDate) {
		this.flucDate = flucDate;
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

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}
}
