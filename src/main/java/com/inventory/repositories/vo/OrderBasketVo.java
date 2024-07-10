package com.inventory.repositories.vo;

import java.util.Date;

public class OrderBasketVo {

	private int basket_id;
	private String order_id;
	private String branch_id;
	private String book_code;
	private String book_name;
	private int quantity;

	public OrderBasketVo() {

	}

	public OrderBasketVo(String book_code, String book_name, int quantity) {

		this.book_code = book_code;
		this.book_name = book_name;
		this.quantity = quantity;
	}

	public OrderBasketVo(String order_id, String branch_id, String book_code, int quantity) {
		
		this.order_id = order_id;
		this.branch_id = branch_id;
		this.book_code = book_code;
		this.quantity = quantity;
	}

	public OrderBasketVo(int basket_id, String order_id, String branch_id, String book_code, String book_name,
			int quantity) {

		this.basket_id = basket_id;
		this.order_id = order_id;
		this.branch_id = branch_id;
		this.book_code = book_code;
		this.book_name = book_name;
		this.quantity = quantity;
	}

	public int getBasket_id() {
		return basket_id;
	}

	public void setBasket_id(int basket_id) {
		this.basket_id = basket_id;
	}

	public String getOrder_id() {
		return order_id;
	}

	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}

	public String getBranch_id() {
		return branch_id;
	}

	public void setBranch_id(String branch_id) {
		this.branch_id = branch_id;
	}

	public String getBook_code() {
		return book_code;
	}

	public void setBook_code(String book_code) {
		this.book_code = book_code;
	}

	public String getBook_name() {
		return book_name;
	}

	public void setBook_name(String book_name) {
		this.book_name = book_name;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "OrderBasketVo [basket_id=" + basket_id + ", order_id=" + order_id + ", branch_id=" + branch_id
				+ ", book_code=" + book_code + ", book_name=" + book_name + ", quantity=" + quantity + "]";
	}

}