package com.inventory.repositories.vo;

import java.util.Date;

public class OrderBasketVo {

	private int basket_id;
	private int order_id;
	private String branch_id;
	private String book_code;
	private int quantity;

	
	
	public OrderBasketVo() {
	
	}

	


	public OrderBasketVo(String book_code, int quantity) {
		super();
		this.book_code = book_code;
		this.quantity = quantity;
	}




	public int getBasket_id() {
		return basket_id;
	}



	public void setBasket_id(int basket_id) {
		this.basket_id = basket_id;
	}



	public int getOrder_id() {
		return order_id;
	}



	public void setOrder_id(int order_id) {
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



	public int getQuantity() {
		return quantity;
	}



	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}



	@Override
	public String toString() {
		return "OrderBasketVo [basket_id=" + basket_id + ", order_id=" + order_id + ", branch_id=" + branch_id
				+ ", book_code=" + book_code + ", quantity=" + quantity + "]";
	}

}
