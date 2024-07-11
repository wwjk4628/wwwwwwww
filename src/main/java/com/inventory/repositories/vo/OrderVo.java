package com.inventory.repositories.vo;

import java.text.SimpleDateFormat;
import java.util.Date;

public class OrderVo {

	private String orderId;
	private String branchId;
	private Date orderDate;
	private String checked;

	public OrderVo(String branchId) {

		this.branchId = branchId;
	}

	public OrderVo() {

	}

	public OrderVo(String orderId, String branchId, Date orderDate, String checked) {

		this.orderId = orderId;
		this.branchId = branchId;
		this.orderDate = orderDate;
		this.checked = checked;
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

	@Override
	public String toString() {
		return "OrderVo [orderId=" + orderId + ", branchId=" + branchId + ", orderDate=" + orderDate + ", checked="
				+ checked + "]";
	}

}
