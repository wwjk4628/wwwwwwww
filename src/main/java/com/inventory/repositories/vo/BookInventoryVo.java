package com.inventory.repositories.vo;

import java.util.Date;

public class BookInventoryVo {
	
	private String branchId;
	private String bookCode;
	private String bookName;
	private int inventory;
	private Date inDate;
	private Date outDate;
	
	public BookInventoryVo() {
		
	}

	public BookInventoryVo(String branchId, String bookCode, String bookName, int inventory, Date inDate,
			Date outDate) {
		super();
		this.branchId = branchId;
		this.bookCode = bookCode;
		this.bookName = bookName;
		this.inventory = inventory;
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

	public int getInventory() {
		return inventory;
	}

	public void setInventory(int inventory) {
		this.inventory = inventory;
	}

	@Override
	public String toString() {
		return "BookInventoryVo [branchId=" + branchId + ", bookCode=" + bookCode + ", bookName=" + bookName
				+ ", inventory=" + inventory + ", inDate=" + inDate + ", outDate=" + outDate + "]";
	}
	
	
}
