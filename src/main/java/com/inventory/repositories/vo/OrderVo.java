package com.inventory.repositories.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderVo {

	private String orderId;
	private String bookCode;
	private String branchId;
	private Integer quantity;
	private Date orderDate;
	private String checked;

	public OrderVo(String branchId) {

		this.branchId = branchId;
	}

	public OrderVo() {

	}

    // Full constructor
    public OrderVo(String orderId, String branchId, Date orderDate, String checked, String bookName) {
        this.orderId = orderId;
        this.branchId = branchId;
        this.orderDate = orderDate;
        this.checked = checked;
        this.bookName = bookName;
    }

    // Constructor for order list verification
    public OrderVo(String orderId, String branchId, Date orderDate, String checked) {
        this.orderId = orderId;
        this.branchId = branchId;
        this.orderDate = orderDate;
        this.checked = checked;
    }

    // Getters and Setters
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

    public String getOrderDate() {
        if (orderDate == null) {
            return "";
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
        return dateFormat.format(orderDate);
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

    public String getBookName() {
        return bookName;
    }

    public void setBookName(String bookName) {
        this.bookName = bookName;
    }

    // toString method
    @Override
    public String toString() {
        return "OrderVo [orderId=" + orderId + ", branchId=" + branchId + ", orderDate=" + orderDate + ", checked=" + checked 
             + ", bookName=" + bookName + "]";
    }
}
