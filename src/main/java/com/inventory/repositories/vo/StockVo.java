package com.inventory.repositories.vo;

import java.text.SimpleDateFormat;
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

	public StockVo() {

	}

	// stock_in detail 볼 때 사용
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

	// stock_in list 볼 때 사용
	public StockVo(int id, String branchId, Date flucDate, int orderId, String checkedIn) {
		super();
		this.id = id;
		this.branchId = branchId;
		this.flucDate = flucDate;
		this.orderId = orderId;
		this.checkedIn = checkedIn;
	}

	// in_detail 입력에 사용
	public StockVo(int id, String bookCode, int quantity) {
		this.quantity = quantity;
		this.id = id;
		this.bookCode = bookCode;
	}

	// 재고 반영에 사용
	public StockVo(String branchId, String bookCode, int quantity) {
		this.branchId = branchId;
		this.bookCode = bookCode;
		this.quantity = quantity;
	}

	public StockVo(String branchId, String bookCode, int quantity, String bookName) {
		this.branchId = branchId;
		this.bookCode = bookCode;
		this.quantity = quantity;
		this.bookName = bookName;
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

	public String getFlucDate() {
		if (flucDate == null) {
			return "";
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		return dateFormat.format(flucDate);
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
